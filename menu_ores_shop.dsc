menu_ores_shop:
    type: inventory
    inventory: CHEST
    title: <&6>광물 상점
    size: 45
    gui: true
    slots:
    - [border] [border] [border] [border] [border] [border] [border] [border] [border]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

menu_crops_shop_world:
    type: world
    events:
        on player clicks back in menu_ores_shop:
        - inventory open d:menu_gui