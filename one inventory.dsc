# 이루(https://github.com/uniqueleru)님이 작성하신 스크립트와 연동되는 스크립트입니다. (요구파일: gui.dsc, util.dsc)
# 주의: '/optiongui'에서 인벤토리 한 칸을 활성화 후 한 번 죽어야 작동하기 시작합니다.
# script written by 어라랍

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

        # 이 아래부터는 금지된 슬롯(empty_slot)과의 모든 상호작용을 금지하기 위한 월드 스크립트입니다.
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

# 금지된 슬롯 정의
empty_slot:
    type: item
    material: light_gray_stained_glass_pane
    display name: ' '
