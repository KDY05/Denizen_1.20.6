nodrops_init:
    type: world
    events:
        on scripts loaded:
        - if !<server.has_flag[nodrops]>:
            - flag server nodrops:false

nodrops_world:
    type: world
    enabled: <server.flag[nodrops]>
    events:
        on player dies:
        - determine NO_DROPS

nodrops_command:
    type: command
    name: nodrops
    description: nodrops command
    usage: /nodrops on|off
    tab completions:
        1: on|off
    script:
    - if <context.args.is_empty>:
            - narrate "<&e>/nodrops on|off" targets:<player>
            - stop
    - else:
        - choose <context.args.first>:
            - case on:
                - flag server nodrops:true
                - reload scripts_now
                - narrate "아이템을 떨구지 않습니다."
                - stop
            - case off:
                - flag server nodrops:false
                - reload scripts_now
                - narrate "아이템을 떨굽니다."
                - stop
            - default:
                - narrate "<&e>/nodrops on|off" targets:<player>