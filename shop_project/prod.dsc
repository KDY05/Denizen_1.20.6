crops_shop1:
    type: inventory
    inventory: CHEST
    title: <&2>농작물 상점
    size: 45
    gui: true
    slots:
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [wheat_prod] [potato_prod] [] [] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

wheat_prod:
    type: item
    material: wheat
    display name: ''
    flags:
        sell: 100
        buy: 150
    lore:
    - <&7> - 판매: 좌클릭 | 구매: 우클릭
    - <&7> - 판매가: 100
    - <&7> - 구매가: 150

potato_prod:
    type: item
    material: potato
    display name: ''
    flags:
        sell: 80
        buy: 120
    lore:
    - <&7> - 판매: 좌클릭 | 구매: 우클릭
    - <&7> - 판매가: 80
    - <&7> - 구매가: 120

fishing_shop1:
    type: inventory
    inventory: CHEST
    title: <&9>낚시 상점
    size: 45
    gui: true
    slots:
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

ores_shop1:
    type: inventory
    inventory: CHEST
    title: <&6>광물 상점
    size: 45
    gui: true
    slots:
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]