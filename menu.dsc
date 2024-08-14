menu_keybind:
    type: world
    events:
        on player swaps items:
        - if <player.is_sneaking>:
            - inventory open d:menu_gui
            - narrate "<&e>메뉴를 열었습니다."
            - determine cancelled

menu_gui:
    type: inventory
    inventory: CHEST
    title: 메인 메뉴
    size: 45
    gui: true
    slots:
    - [border] [border] [border] [border] [border] [border] [border] [border] [border]
    - [] [] [] [] [] [] [] [] []
    - [] [menu_gui_crops] [] [] [menu_gui_fishing] [] [] [menu_gui_ores] []
    - [] [] [] [] [] [] [] [] []
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

menu_gui_world:
    type: world
    events:
        on player clicks in menu_gui:
        - if <context.item> == <item[menu_gui_crops]>:
            - inventory open d:menu_crops_shop
        - if <context.item> == <item[menu_gui_fishing]>:
            - inventory open d:menu_fishing_shop
        - if <context.item> == <item[menu_gui_ores]>:
           - inventory open d:menu_ores_shop
        - if <context.item> == <item[back]>:
           - inventory close

menu_gui_crops:
    type: item
    material: wheat
    display name: <&2>농작물 상점
    lore:
    - <&7>
    - <&7> - 농작물을 판매합니다.
    - <&7>

menu_gui_fishing:
    type: item
    material: cod
    display name: <&9>낚시 상점
    lore:
    - <&7>
    - <&7> - 어획물을 판매합니다.
    - <&7>

menu_gui_ores:
    type: item
    material: iron_ingot
    display name: <&6>광물 상점
    lore:
    - <&7>
    - <&7> - 광물을 판매합니다.
    - <&7>

border:
    type: item
    material: gray_stained_glass_pane
    display name: ' '

back:
    type: item
    material: barrier
    display name: <&f>뒤로 가기