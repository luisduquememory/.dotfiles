abbr genin "swsdk task generate-inputs -p"
abbr genout "swsdk task generate-outputs"
abbr stest "swsdk integration test -s"
abbr swb "swsdk integration build -s -v 3.7"
abbr swbump "swsdk integration update"
abbr swg "swsdk task run -s  --generate"
abbr swr "swsdk task run -s --verbose"
abbr swv "swsdk integration validate -s"

function sdkdev -d "link to local swsdk"
    $HOME/code/swimlane/swimlane-sdk-cli/bin/run $argv
end

function swrl -d "run a task with the local run container"
    # the argument is the integration folder name
	# 1. Build the container
    echo "Building docker image"
	docker build -f $HOME/code/swimlane/sdk-run/Dockerfile --build-arg PYTHON_VERSION=3.7  -t local/sdk-cli-run:3.7 $HOME/code/swimlane/sdk-run
    echo "Saving imagen ID"
	set RUNIMAGE (docker images -a | grep local/sdk-cli-run | awk '{print $3}')
	echo $RUNIMAGE
    set integration "/Users/luis.duque/code/swimlane-plugins/$argv"
    echo "Running integration in $integration"
	swsdk task:run -d $integration -s -i $RUNIMAGE --verbose
end

function swri -d "build a local docker run image and return the image ID"
    # the argument is the integration folder name
	# 1. Build the container
    echo "Building docker image"
	docker build -f $HOME/code/swimlane/sdk-run/Dockerfile --build-arg PYTHON_VERSION=3.7  -t local/sdk-cli-run:3.7 $HOME/code/swimlane/sdk-run
    echo "Saving imagen ID"
	set RUNIMAGE (docker images -a | grep local/sdk-cli-run | awk '{print $3}')
	echo $RUNIMAGE
end

function scd -d "fuzzy find a plugin and cd into it"
    set dir $HOME/code/swimlane/
    set plugin (ls $dir  | fzf)
    cd $dir$plugin
    vf activate swplugins
end

function gentests -d "generate tests for all tasks which has data already generated"
    python $HOME/Documents/scripts/gentests.py
end

function tasks -d "return a list of tasks names and corresponding manifests on a integration"
    node $HOME/Documents/scripts/tasks_names.js
end

function flat -d "flat a payload and put in the clipboard"
    python $HOME/Documents/scripts/flat_payload.py
end

function gensteps -d "generate test steps"
    node $HOME/Documents/scripts/gen_steps.js
end
