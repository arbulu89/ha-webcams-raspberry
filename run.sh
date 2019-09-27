salt-call --local --file-root=./salt state.highstate # Configure this machine to act as salt master
salt-ssh -i raspberry1 state.apply minion_configuration # Configure raspberries salt minion (minion_configuration)
salt-ssh -i raspberry2 state.apply minion_configuration # Configure raspberries salt minion (minion_configuration)
salt '*' state.highstate # Run the actual salt execution (salt_root content)
