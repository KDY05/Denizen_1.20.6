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
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [shop] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [border] [border] [border] [border] [border]

menu_gui_world:
    type: world
    events:
        on player clicks in menu_gui:
        - if <context.item> == <item[shop]>:
            - execute as_player "shop"

border:
    type: item
    material: black_stained_glass_pane
    display name: ' '

shop:
    type: item
    material: emerald
    display name: 상점
    lore:
    - <&7>
    - <&7> - 상점을 엽니다.
    - <&7>