export FIRST_HOME="$CODE_HOME/Data_analysis/First"
export DAVINCI_HOME="$CODE_HOME/Data_analysis/First/davinci/"
export VESTA_HOME="$CODE_HOME/Data_analysis/First/vesta/"
export DATA_HOME="$CODE_HOME/Data_analysis/First/data/"
export PYTHONPATH=$PYTHONPATH:$DAVINCI_HOME
export PATH=$PATH:$PYTHONPATH
export PATH=$PATH:~/App_build

export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib/native"
export PYTHONIOENCODING="utf-8"

export JAVA_HOME="$(/usr/libexec/java_home)"
# export JAVA_HOME="/Library/Java/Home"
export SPARK_HOME=/Applications/App_build/spark-2.4.0-bin-hadoop2.7
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON="/Applications/Anaconda3/envs/py3/bin/python"
export SFN_DIR="/Users/ziyue/Code/Data_Analysis/First/state_machines_ds"

alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/stop-dfs.sh"
alias zepstart="~/App_build/zeppelin-0.7.1-bin-all/bin/zeppelin-daemon.sh start"
alias zepstop="~/App_build/zeppelin-0.7.1-bin-all/bin/zeppelin-daemon.sh stop"

# data
first_lftp () {
	lftp -p 22 -u $CI_FTP_USERNAME,$CI_FTP_PASSWORD sftp://sfgext.acxiom.com
}

get_premover() {
	/Applications/anaconda3/envs/py27/bin/python $FIRST_HOME/pipeline/premover/premover_download_upload.py $1 $2
}

load_scored_data_to_predictive_people() {
	python $FIRST_HOME/augment-services/resources/databricks/predictive-people/start_load.py "$@"
}

presign_url() {
	aws s3 presign --expires-in 604800 $1
}

# sync
sync_spark() {
	# sync vesta folder
	aws s3 sync $FIRST_HOME/vesta/vesta/ s3://first-io-datalake-production/user/Li/code/vesta/ --exclude "*.git/*" --exclude ".idea/*" --delete
	# zip davinci package
	cd $FIRST_HOME
	cd davinci
	rm davinci.zip
	zip -r davinci.zip davinci
	# sync davinci package
	aws s3 sync $FIRST_HOME/davinci/ s3://first-io-datalake-production/user/Li/code/davinci/ --exclude "*.git/*" --exclude ".idea/*" --delete
	# sync serects
	aws s3 cp $HOME/.davinci_secrets.yml s3://first-io-datalake-production/user/Li/code/.davinci_secrets.yml
}


sync_brainy_flat_table_to_athena() {
	python2 $FIRST_HOME/pipeline/sync_brainy/Sync_agents_data_and_create_Athena_table.py
}

upload_spark() {
	aws s3 cp $FIRST_HOME/spark/src/main/Pyspark_2.0/ s3://predictive-model/code/Li/Spark_national_model/ --recursive
}

sync_reports() {
	conda deactivate
	source activate py3
	jupyter nbconvert --ExecutePreprocessor.kernel_name=python --to html --execute $FIRST_HOME/data_analysis/index.ipynb --output $FIRST_HOME/data_analysis/reports/index.html --template=report.tpl
	conda deactivate
	aws s3 sync $FIRST_HOME/data_analysis/reports s3://first-io-data-analysis/data_science --include "*.html" --exclude "*.DS_Store" --exclude ".*" --exclude "*.py" --delete
	aws cloudfront create-invalidation --distribution-id EHIS1O5LAO3RR --paths '/*'
}

# ssh
ec2_li() {
    ssh -i ~/.ssh/ziyueli_first.pem ubuntu@$@
}

ec2_li_bastion() {
    ssh -i ~/.ssh/ziyueli_first.pem ubuntu@$1
}

ec2_first() {
    ssh -i ~/.ssh/firstUbuntu.pem ubuntu@$1
}

spark_li_web() {
	ssh -i ~/.ssh/ziyueli_first.pem -ND 8157 hadoop@$1
}

spark_li() {
	ssh -i ~/.ssh/ziyueli_first.pem hadoop@$1
}

spark_li_bastion() {
	ssh hadoop@$1
}

spark_test() {
	ssh -i ~/.ssh/test-cal.pem hadoop@$1
}


# utilities
convertshape() {
	ogr2ogr -f "ESRI Shapefile" $FIRST_HOME/input/shapefiles/$1.shp $FIRST_HOME/input/shapefiles/$1.kml
}


# docker
dockerCsvCleanUp() {
	docker run -it --rm -p 9000:9000 -v /Users/ziyue/OneDrive/Code/Data_analysis/First/data_pipeline:/mnt/notebooks jupyter-first:1.0.0
}

dockerBuildFetchAndRun () {
	cd $FIRST_HOME/docker/list_scoring-test
	docker build -t fetch_and_run .
	docker tag fetch_and_run:latest 485000428307.dkr.ecr.us-west-2.amazonaws.com/fetch_and_run:latest
	docker push 485000428307.dkr.ecr.us-west-2.amazonaws.com/fetch_and_run:latest
}


# AWS
delete_sfn_and_lambdas () {
	cd $FIRST_HOME
	cd state_machines_ds
	python delete.py
}



#####################################################
# old functions for county models (to be deprecated)
sync_agent_data () {
	date=`date +%Y%m%d`
	runipy ~/OneDrive/Code/Data_analysis/First/cortex/Data_pipeline/Sync_agents_data_and_create_Athena_table-cleaned_up.ipynb ~/OneDrive/Code/Data_analysis/First/output/scheduled_jobs/sync_agent_contacts_and_create_Athena_table-${date}.ipynb
	jupyter nbconvert --to html ~/OneDrive/Code/Data_analysis/First/output/scheduled_jobs/sync_agent_contacts_and_create_Athena_table-${date}.ipynb
}

ipyjob () {
	export FILE_NAME=$1
	runipy ~/IPython_notebook/predictive-model/ipython/New_model-Ziyue_Li/Acxiom_targetModel_POC_Ziyue_Li.ipynb ~/IPython_notebook/output/ipynb_report_html/${FILE_NAME}${BATCH_ID}.ipynb
	# jupyter nbconvert --to html ~/IPython_notebook/output/ipynb_report_html/${FILE_NAME}${BATCH_ID}.ipynb
	# aws s3 cp ~/IPython_notebook/output/ipynb_report_html/${FILE_NAME}${BATCH_ID}.html s3://predictive-model/datafiles/output/New_model_Li/ipynb_report_html/${FILE_NAME}${BATCH_ID}.html
	# rm ~/IPython_notebook/output/ipynb_report_html/${FILE_NAME}${BATCH_ID}.ipynb
}

batchloop () {
	export BATCH_ID=$2
	for f in $1
	do
		ipyjob $f
	done
}

# ipybatchjob still needs to be tested
ipybatchjob () {
	cd ~/IPython_notebook/predictive-model/ipython/New_model-Ziyue_Li/
	python ipybatchjob.py "$1" "$2"
}
