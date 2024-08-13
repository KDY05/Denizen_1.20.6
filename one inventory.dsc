# "인벤토리 한 칸 스크립트" written by 어라랍
# '/oneinv'로 모든 플레이어에 대해 키고 끌 수 있습니다.

oneinv_command:
    type: command
    name: oneinv
    description: 인벤토리 한 칸 모드 토글
    usage: /oneinv
    script:
    - if !<server.has_flag[one_inv]>:
        - flag server one_inv:enabled
        - foreach <server.online_players> as:players:
            - run fill_slot_task def.target:<[players]>
            - narrate "<&a>인벤토리 한 칸 모드가 활성화되었습니다." targets:<[players]>
    - else:
        - if <server.flag[one_inv]> == disabled:
            - flag server one_inv:enabled
            - foreach <server.online_players> as:players:
                - run fill_slot_task def.target:<[players]>
                - narrate "<&a>인벤토리 한 칸 모드가 활성화되었습니다." targets:<[players]>
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