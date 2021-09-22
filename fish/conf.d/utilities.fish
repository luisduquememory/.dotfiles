function pycount -d "run my current guitar practice count"
    python $HOME/Documents/scripts/counter/count.py
end


function dcrmi -d "delete all docker images"
    docker images -a | awk '{print $3}' | xargs docker rmi
end

function cleanenv -d "remove all packages in the current python interpreter"
    python -m pip freeze | xargs python -m pip uninstall -y
end

function prepy -d "prepare a python repository with my personal configs"
    ln -sv $HOME/code/configs/pre-commit-config.yaml ./.pre-commit-config.yaml
	python -m pip install --upgrade pip
	python -m pip install pre-commit
	pre-commit install
	echo '.pre-commit-config.yaml' >> .gitignore
end

function pypath -d "add the current directory as PYTHONPATH"
  set -e PYTHONPATH
	set -Ux PYTHONPATH $PWD
	set --show PYTHONPATH
end

function buildnvim -d "build nvim from source"
  echo "Entering in neovim source folder..."
  cd ~/src/neovim
  echo "Pulling master branch..."
  git pull origin master
  echo "Making a distclean..."
  sudo make distclean
  echo "Running make..."
  make CMAKE_BUILD_TYPE=Release
  echo "Running make install ..."
  sudo make install
  echo "Displaying version and build type..."
  nvim --version
  ./build/bin/nvim --version | grep ^Build
  echo "Returning to previous directory..."
  cd -
end
