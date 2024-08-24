# "인벤토리 한 칸 스크립트" written by 어라랍
# '/oneinv on|off'로 모든 플레이어에 대해 켜거나 끌 수 있습니다.

oneinv_command:
    type: command
    name: oneinv
    description: 인벤토리 한 칸 모드 커맨드
    usage: /oneinv on|off
    tab completions:
        1: on|off
    script:
    - if <player.is_op>:
        - if <context.args.is_empty>:
            - narrate "<&e>/oneinv on|off" targets:<player>
            - stop
        - choose <context.args.first>:
            - case on:
                - run oneinv_on_task
                - stop
            - case off:
                - run oneinv_off_task
                - stop
            - default:
                - narrate "<&e>/oneinv on|off" targets:<player>
    - else:
        - narrate "<&7>당신은 권한을 가지고 있지 않습니다." targets:<player>

oneinv_on_task:
    type: task
    script:
    - if !<server.has_flag[one_inv]>:
        - flag server one_inv:enabled
        - foreach <server.online_players> as:players:
            - run fill_slot_task def.target:<[players]>
            - narrate "<&a>인벤토리 한 칸 모드가 활성화되었습니다." targets:<[players]>
    - else if <server.flag[one_inv]> == enabled:
        - narrate "<&7>이미 활성화 상태입니다."
    - else:
        - flag server one_inv:enabled
        - foreach <server.online_players> as:players:
            - run fill_slot_task def.target:<[players]>
            - narrate "<&a>인벤토리 한 칸 모드가 활성화되었습니다." targets:<[players]>

oneinv_off_task:
    type: task
    script:
    - if !<server.has_flag[one_inv]>:
        - flag server one_inv:disabled
        - foreach <server.online_players> as:players:
            - repeat 36 as:count:
                - if <[count]> != 5:
                    - inventory set d:<[players].inventory> slot:<[count]> o:air
            - narrate "<&c>인벤토리 한 칸 모드가 비활성화되었습니다." targets:<[players]>
    - else if <server.flag[one_inv]> == disabled:
        - narrate "<&7>이미 비활성화 상태입니다."
    - else:
        - flag server one_inv:disabled
        - foreach <server.online_players> as:players:
            - repeat 36 as:count:
                - if <[count]> != 5:
                    - inventory set d:<[players].inventory> slot:<[count]> o:air
            - narrate "<&c>인벤토리 한 칸 모드가 비활성화되었습니다." targets:<[players]>

oneinv_world:
    type: world
    events:
        on player dies:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - define saved <player.inventory.slot[5]>
        - drop <[saved]> <player.location>
        - foreach <player.equipment> as:equip:
            - drop <[equip]> <player.location>
        - determine NO_DROPS
        after player dies:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - run fill_slot_task def.target:<player>
        on player swaps items:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - determine cancelled

fill_slot_task:
    type: task
    definitions: target
    script:
    - repeat 36 as:count:
        - if <[count]> != 5:
            - define saved <[target].inventory.slot[<[count]>]>
            - drop <[saved]> <[target].location>
            - inventory set d:<[target].inventory> slot:<[count]> o:empty_slot
    - drop <[target].item_in_offhand> <[target].location>
    - adjust <[target]> item_in_offhand:air

empty_slot_interaction:
    type: world
    events:
        on player drops empty_slot:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - determine cancelled
        on player clicks empty_slot in inventory:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - determine cancelled
        on player drags empty_slot in inventory:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - determine cancelled
        on player places empty_slot:
        - if <server.flag[one_inv]> == disabled:
            - stop
        - determine cancelled

empty_slot:
    type: item
    material: light_gray_stained_glass_pane
    display name: ' '