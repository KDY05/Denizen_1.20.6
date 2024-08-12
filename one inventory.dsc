# 이루(https://github.com/uniqueleru/Denizen-1.20.6)님이 작성하신 스크립트와 연동되며, 단독 사용도 가능합니다.
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
    - else:
        - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
            - flag server one_inventory:<server.flag[text_enabled]>
            - narrate "<&a>인벤토리 한 칸 모드 활성화"
        - else:
            - flag server one_inventory:<server.flag[text_disabled]>
            - narrate "<&c>인벤토리 한 칸 모드 비활성화"

one_inventory_world:
    type: world
    events:
        on player dies:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - define saved <player.inventory.slot[5]>
            - drop <[saved]> <player.location>
            - determine NO_DROPS

        after player dies:
            - if <server.flag[one_inventory]> == <server.flag[text_disabled]>:
                - stop
            - repeat 36 as:count:
                - define slot <[count]>
                - if <[slot]> != 5:
                    - inventory set d:<player.inventory> slot:<[slot]> o:empty_slot

empty_slot:
    type: item
    material: light_gray_stained_glass_pane
    display name: ' '

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