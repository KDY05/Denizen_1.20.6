# '/oneinv'로 모든 플레이어에 대해 키고 끌 수 있습니다.
# script written by 어라랍

script_load:
    type: world
    events:
        on scripts loaded:
            - flag server text_enabled:<&a>활성화됨
            - flag server text_disabled:<&c>비활성화됨

oneinv_command:
    type: command
    name: oneinv
    description: 인벤토리 한 칸 모드 토글
    usage: /oneinv
    script:
    - if !<server.has_flag[one_inventory]>:
        - flag server one_inventory:<server.flag[text_enabled]>
        - foreach <server.online_players> as:players:
            - run fill_slot_task def.target:<[players]>
        - narrate "<&a>인벤토리 한 칸 모드가 활성화되었습니다." targets:<server.online_players>
    - else:
        - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
            - flag server one_inventory:<server.flag[text_enabled]>
            - foreach <server.online_players> as:players:
                - run fill_slot_task def.target:<[players]>
            - narrate "<&a>인벤토리 한 칸 모드가 활성화되었습니다." targets:<server.online_players>
        - else:
            - flag server one_inventory:<server.flag[text_disabled]>
            - foreach <server.online_players> as:players:
                - repeat 36 as:count:
                    - define slot <[count]>
                    - if <[slot]> != 5:
                        - inventory set d:<[players].inventory> slot:<[slot]> o:air
            - narrate "<&c>인벤토리 한 칸 모드가 비활성화되었습니다." targets:<server.online_players>

oneinv_world:
    type: world
    events:
        on player dies:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - define saved <player.inventory.slot[5]>
            - drop <[saved]> <player.location>
            - determine NO_DROPS
        after player dies:
            - run fill_slot_task def.target:<player>

fill_slot_task:
    type: task
    definitions: target
    script:
        - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
        - repeat 36 as:count:
                - define slot <[count]>
                - if <[slot]> != 5:
                    - define saved <[target].inventory.slot[<[slot]>]>
                    - drop <[saved]> <[target].location>
        - repeat 36 as:count:
            - define slot <[count]>
            - if <[slot]> != 5:
                - inventory set d:<[target].inventory> slot:<[slot]> o:empty_slot

empty_slot_interaction:
    type: world
    events:
        on player drops empty_slot:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - determine cancelled
        on player clicks empty_slot in inventory:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - determine cancelled
        on player drags empty_slot in inventory:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - determine cancelled
        on player swaps items:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - determine cancelled
        on player places empty_slot:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - determine cancelled

empty_slot:
    type: item
    material: light_gray_stained_glass_pane
    display name: ' '