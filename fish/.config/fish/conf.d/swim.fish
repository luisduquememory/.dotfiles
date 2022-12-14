# swimlane
abbr stest "swsdk integration test -s"
abbr swb "swsdk integration build -s -v 3.7"
abbr swg "swsdk task run -s  --generate"
abbr swr "swsdk task run -s --verbose"
abbr swv "swsdk integration validate -s"

# turbine
abbr genin "tsdk action generate input"
abbr genout "tsdk action generate output"
abbr turadd "tsdk action add"

function swd -d "debug task with local container"
  # select the task to debug
  set task (path basename (ls ./imports/**.py  | fzf)) # see https://fishshell.com/docs/current/cmds/path.html
  set task (path change-extension '' $task)
	# Build the container
  echo "Building docker image"
  docker build -f $HOME/code/swimlane/sdk-run/Dockerfile --build-arg PYTHON_VERSION=3.7  -t local/sdk-cli-run:3.7 $HOME/code/swimlane/sdk-run
  echo "Saving imagen ID"
	set RUNIMAGE (docker images -a | grep local/sdk-cli-run | awk '{print $3}')
	echo "Running task with local image and debug flag"
  swsdk task run -s --verbose -n $task -s -i $RUNIMAGE --debug code
end

function scd -d "fuzzy find a plugin and cd into it"
    set dir $HOME/code/swimlane/
    set plugin (ls $dir  | fzf)
    cd $dir$plugin
    vf activate venv_
end

function gentests -d "generate tests for all tasks which has data already generated"
    python $HOME/Documents/scripts/gentests.py
end

function tasks -d "return a list of tasks names and corresponding manifests on a integration"
    node $HOME/Documents/scripts/tasks_names.js
end

function gensteps -d "generate test steps"
    node $HOME/Documents/scripts/gen_steps.js
end


function turkey -d "generate a public key for turbine connectors"
  rm -R $HOME/.config/@swimlane/turbine-sdk/keys/
  tsdk turbine connector keys generate --key-name $TURBINE_KEY_NAME --signing-password $TURBINE_SIGN_PASSWORD --turbine-url $TURBINE_URL -u $TURBINE_USERNAME  -p $TURBINE_PASSWORD
  echo "key generated"
end

function turbuild -d "build connector locally"
  echo "Deleting old connector artifatcs -> *.tar.gz"
  ls *tar.gz
  rm *tar.gz
  tsdk connector build --template python_310_definition --key-name $TURBINE_KEY_NAME --signing-password $TURBINE_SIGN_PASSWORD --save --registry=localhost:5001
  echo "Saving new connector artifact..."
  set CONNECTOR_ARTIFACT (ls *tar.gz)
  ls *tar.gz
  tsdk turbine connector push -f $CONNECTOR_ARTIFACT -p $TURBINE_PASSWORD -u $TURBINE_USERNAME --turbine-url $TURBINE_URL
end

function turrepo -d "creates connector repo"
    if count $argv > /dev/null
      gh workflow run "Setup Repository" --repo="swimlane-connectors/connector-workflows" -f "name=$argv" -f "template_repo=connector-template" -f "topics=connector"
    else
        echo "provide a repository name"
    end
end

function tur -d "run a turbine action locally"
    if count $argv > /dev/null
      tsdk action run local -a $argv; cat (string join "" "data/" "$argv" "_output.json") | jq '.'
    else
      tsdk action run local
    end
end
