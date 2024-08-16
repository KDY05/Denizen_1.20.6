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
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [shop] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

menu_gui_world:
    type: world
    events:
        on player clicks in menu_gui:
        - if <context.item> == <item[shop]>:
            - inventory open d:shop_section
        - if <context.item> == <item[back]>:
            - inventory close
shop:
    type: item
    material: emerald
    display name: 상점
    lore:
    - <&7>
    - <&7> - 상점을 엽니다.
    - <&7>

profile:
    type: item
    material: <player.skull_item>
    display name: <player.name>
    lore:
    - <&f>
    - <&f> 소지금: <player.formatted_money>
    - <&f>

border:
    type: item
    material: gray_stained_glass_pane
    display name: ' '

back:
    type: item
    material: barrier
    display name: <&f>뒤로 가기