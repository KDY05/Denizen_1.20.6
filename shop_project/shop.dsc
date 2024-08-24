shop_world:
    type: world
    events:
        on player clicks in shop_section:
        - if <context.item> == <item[crops_shop]>:
            - inventory open d:crops_shop1
        - if <context.item> == <item[fishing_shop]>:
            - inventory open d:fishing_shop1
        - if <context.item> == <item[ores_shop]>:
           - inventory open d:ores_shop1
        - if <context.item> == <item[back]>:
           - inventory open d:menu_gui
        on player clicks back in *_shop1:
        - inventory open d:shop_section
        on player left clicks *_prod in *_shop1:
        - flag player sell:<context.item>
        - inventory open d:selling_page
        on player right clicks *_prod in *_shop1:
        - flag player buy:<context.item>
        - inventory open d:buying_page
        on player clicks in selling_page:
        - if <context.item> == <item[sell_1]> || <context.item> == <item[sell_16]> || <context.item> == <item[sell_64]>:
            - define item <player.flag[sell]>
            - define item_sell_value <[item].flag[sell].mul[<context.item.flag[quan]>]>
            - define item_m <item[paper]>
            - adjust <[item_m]> material:<[item].material>
            - take item:<[item_m]> quantity:<context.item.flag[quan]> from:<player.inventory>
            - money give players:<player> quantity:<[item_sell_value]>
            - inventory open d:selling_page
            - narrate "판매 완료(+<[item_sell_value]>)"
        - if <context.item> == <item[back]>:
            - inventory open d:shop_section
        on player clicks in buying_page:
        - if <context.item> == <item[buy_1]> || <context.item> == <item[buy_16]> || <context.item> == <item[buy_64]>:
            - define item <player.flag[buy]>
            - define item_buy_value <[item].flag[buy].mul[<context.item.flag[quan]>]>
            - define item_m <item[paper]>
            - adjust <[item_m]> material:<[item].material>
            - give <[item_m]> quantity:<context.item.flag[quan]> to:<player.inventory>
            - money take players:<player> quantity:<[item_buy_value]>
            - inventory open d:buying_page
            - narrate "구매 완료(-<[item_buy_value]>)"
        - if <context.item> == <item[back]>:
            - inventory open d:shop_section

shop_section:
    type: inventory
    inventory: CHEST
    title: 상점 섹션
    size: 45
    gui: true
    slots:
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [crops_shop] [] [] [fishing_shop] [] [] [ores_shop] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

selling_page:
    type: inventory
    inventory: CHEST
    title: 상품 판매
    size: 45
    gui: true
    definitions:
        selling_item: <player.flag[sell]>
    slots:
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [] [] [] [selling_item] [] [] [] [border]
    - [border] [] [] [sell_1] [sell_16] [sell_64] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

buying_page:
    type: inventory
    inventory: CHEST
    title: 상품 구매
    size: 45
    gui: true
    definitions:
        buying_item: <player.flag[buy]>
    slots:
    - [border] [border] [border] [border] [profile] [border] [border] [border] [border]
    - [border] [] [] [] [buying_item] [] [] [] [border]
    - [border] [] [] [buy_1] [buy_16] [buy_64] [] [] [border]
    - [border] [] [] [] [] [] [] [] [border]
    - [border] [border] [border] [border] [back] [border] [border] [border] [border]

crops_shop:
    type: item
    material: wheat
    display name: <&2>농작물 상점
    lore:
    - <&7>
    - <&7> - 농작물을 판매합니다.
    - <&7>

fishing_shop:
    type: item
    material: cod
    display name: <&9>낚시 상점
    lore:
    - <&7>
    - <&7> - 어획물을 판매합니다.
    - <&7>

ores_shop:
    type: item
    material: iron_ingot
    display name: <&6>광물 상점
    lore:
    - <&7>
    - <&7> - 광물을 판매합니다.
    - <&7>

sell_1:
    type: item
    material: paper
    display name: 1개 판매
    flags:
        quan: 1

sell_16:
    type: item
    material: paper
    display name: 16개 판매
    flags:
        quan: 16

sell_64:
    type: item
    material: paper
    display name: 64개 판매
    flags:
        quan: 64

buy_1:
    type: item
    material: paper
    display name: 1개 구매
    flags:
        quan: 1

buy_16:
    type: item
    material: paper
    display name: 16개 구매
    flags:
        quan: 16

buy_64:
    type: item
    material: paper
    display name: 64개 구매
    flags:
        quan: 64