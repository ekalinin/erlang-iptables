-module(iptables_test).
-author('e.v.kalinin@gmail.com').

-include_lib("eunit/include/eunit.hrl").

append_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t nat --append PREROUTING -i eth0 -j ACCEPT"},
        iptables:append(nat, prerouting, "-i eth0 -j ACCEPT")),
     ?_assertEqual({ok, "sudo iptables -t filter --append INPUT -i lo -j ACCEPT"},
        iptables:append(input, "-i lo -j ACCEPT"))
    ].

check_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t nat --check PREROUTING -i eth0 -j ACCEPT"},
        iptables:check(nat, prerouting, "-i eth0 -j ACCEPT")),
     ?_assertEqual({ok, "sudo iptables -t filter --check INPUT -i lo -j ACCEPT"},
        iptables:check(input, "-i lo -j ACCEPT"))
    ].

delete_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t nat --delete PREROUTING -i eth0 -j ACCEPT"},
        iptables:delete(nat, prerouting, "-i eth0 -j ACCEPT")),
     ?_assertEqual({ok, "sudo iptables -t filter --delete INPUT -i lo -j ACCEPT"},
        iptables:delete(input, "-i lo -j ACCEPT"))
    ].

insert_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --insert INPUT 1 -i lo -j ACCEPT"},
        iptables:insert(input, "-i lo -j ACCEPT")),
     ?_assertEqual({ok, "sudo iptables -t nat --insert PREROUTING 1 -i eth0 -j ACCEPT"},
        iptables:insert(nat, prerouting, "-i eth0 -j ACCEPT")),
     ?_assertEqual({ok, "sudo iptables -t nat --insert PREROUTING 10 -i eth0 -j ACCEPT"},
        iptables:insert(nat, prerouting, "-i eth0 -j ACCEPT", 10))
    ].

list_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --list-rules"}, iptables:list()),
     ?_assertEqual({ok, "sudo iptables -t filter --list-rules PREROUTING"},
        iptables:list(prerouting)),
     ?_assertEqual({ok, "sudo iptables -t nat --list-rules PREROUTING"},
        iptables:list(nat, prerouting))
    ].

flush_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --flush"}, iptables:flush()),
     ?_assertEqual({ok, "sudo iptables -t filter --flush PREROUTING"},
        iptables:flush(prerouting)),
     ?_assertEqual({ok, "sudo iptables -t nat --flush PREROUTING"},
        iptables:flush(nat, prerouting))
    ].

zero_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --zero"}, iptables:zero()),
     ?_assertEqual({ok, "sudo iptables -t filter --zero PREROUTING"},
        iptables:zero(prerouting)),
     ?_assertEqual({ok, "sudo iptables -t nat --zero PREROUTING"},
        iptables:zero(nat, prerouting))
    ].

create_chain_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --new-chain MY_TABLE"},
        iptables:create_chain(my_table)),
     ?_assertEqual({ok, "sudo iptables -t nat --new-chain MY_TABLE"},
        iptables:create_chain(nat, my_table))
    ].

delete_chain_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --delete-chain"},
        iptables:delete_chain()),
     ?_assertEqual({ok, "sudo iptables -t filter --delete-chain MY_TABLE"},
        iptables:delete_chain(my_table)),
     ?_assertEqual({ok, "sudo iptables -t nat --delete-chain MY_TABLE"},
        iptables:delete_chain(nat, my_table))
    ].

rename_chain_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --rename-chain MY_TABLE MY_NEW_TABLE"},
        iptables:rename_chain(my_table, my_new_table)),
     ?_assertEqual({ok, "sudo iptables -t nat --rename-chain MY_TABLE MY_NEW_TABLE"},
        iptables:rename_chain(nat, my_table, my_new_table))
    ].

policy_test_() -> [
     ?_assertEqual({ok, "sudo iptables -t filter --policy INPUT ACCEPT"},
        iptables:policy(input, accept)),
     ?_assertEqual({ok, "sudo iptables -t nat --policy INPUT DROP"},
        iptables:policy(nat, input, drop))
    ].

is_installed_test_() -> [
     ?_assertEqual({ok, true}, iptables:is_installed())
    ].
