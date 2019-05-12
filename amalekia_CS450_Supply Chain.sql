DROP TABLE items CASCADE CONSTRAINTS;

CREATE TABLE items (
    item         CHAR(9),
    unitweight   NUMBER(4),
    PRIMARY KEY ( item )
); 

--prodItem

INSERT INTO items VALUES (
    'table',
    50
);

INSERT INTO items VALUES (
    'desk',
    60
);
--matItem

INSERT INTO items VALUES (
    'leg',
    5
);

INSERT INTO items VALUES (
    'table_top',
    20
);

INSERT INTO items VALUES (
    'desk_top',
    30
);

DROP TABLE busentities CASCADE CONSTRAINTS;

CREATE TABLE busentities (
    entity    CHAR(25),
    shiploc   CHAR(9),
    address   VARCHAR(20),
    phone     NUMBER(10),
    web       VARCHAR(20),
    contact   CHAR(10),
    PRIMARY KEY ( entity )
); 

--customer

INSERT INTO busentities VALUES (
    'customer1',
    'NYC',
    'add1',
    5654823651,
    'web1',
    'con1'
);

INSERT INTO busentities VALUES (
    'customer2',
    'NYC',
    'add2',
    5654823652,
    'web2',
    'con2'
);
--manufacturer

INSERT INTO busentities VALUES (
    'manufacturer1',
    'Boston',
    'add3',
    6234211231,
    'web3',
    'con3'
);

INSERT INTO busentities VALUES (
    'manufacturer2',
    'DC',
    'add4',
    6234211232,
    'web4',
    'con4'
);
--supplier

INSERT INTO busentities VALUES (
    'supplier1',
    'Boston',
    'add5',
    8734211231,
    'web5',
    'con5'
);

INSERT INTO busentities VALUES (
    'supplier2',
    'DC',
    'add6',
    8734211232,
    'web6',
    'con6'
);

INSERT INTO busentities VALUES (
    'supplier3',
    'NYC',
    'add7',
    8734982743,
    'web7',
    'con7'
);

INSERT INTO busentities VALUES (
    'supplier4',
    'Boston',
    'add8',
    3824938748,
    'web8',
    'con8'
);
--shipper

INSERT INTO busentities VALUES (
    'Fedex',
    'Chicago',
    'add9',
    1382938432,
    'web9',
    'con9'
);

INSERT INTO busentities VALUES (
    'UPS',
    'Boston',
    'add10',
    8373921234,
    'web10',
    'con10'
);

DROP TABLE billofmaterials CASCADE CONSTRAINTS;

CREATE TABLE billofmaterials (
    proditem        CHAR(9),
    matitem         CHAR(9),
    qtymatperitem   NUMBER(3),
    PRIMARY KEY ( proditem,
                  matitem ),
    FOREIGN KEY ( proditem )
        REFERENCES items ( item ),
    FOREIGN KEY ( matitem )
        REFERENCES items ( item )
);

INSERT INTO billofmaterials VALUES (
    'table',
    'leg',
    4
);

INSERT INTO billofmaterials VALUES (
    'table',
    'table_top',
    1
);

INSERT INTO billofmaterials VALUES (
    'desk',
    'leg',
    3
);

INSERT INTO billofmaterials VALUES (
    'desk',
    'desk_top',
    1
);

DROP TABLE supplierdiscounts CASCADE CONSTRAINTS;

CREATE TABLE supplierdiscounts (
    supplier   CHAR(25),
    amt1       NUMBER(5),
    disc1      DECIMAL(7,2),
    amt2       NUMBER(5),
    disc2      DECIMAL(7,2),
    PRIMARY KEY ( supplier )
);

INSERT INTO supplierdiscounts VALUES (
    'supplier1',
    300,
    0.03,
    800,
    0.10
);

INSERT INTO supplierdiscounts VALUES (
    'supplier2',
    500,
    0.07,
    1000,
    0.15
);

INSERT INTO supplierdiscounts VALUES (
    'supplier3',
    500,
    0.10,
    1500,
    0.20
);

INSERT INTO supplierdiscounts VALUES (
    'supplier4',
    1000,
    0.15,
    2000,
    0.25
);

DROP TABLE supplyunitpricing;

CREATE TABLE supplyunitpricing (
    supplier   CHAR(9),
    item       CHAR(9),
    ppu        NUMBER(4),
    PRIMARY KEY ( supplier,
                  item ),
    FOREIGN KEY ( item )
        REFERENCES items ( item )
);

INSERT INTO supplyunitpricing VALUES (
    'supplier1',
    'table',
    25
);

INSERT INTO supplyunitpricing VALUES (
    'supplier1',
    'desk',
    40
);

INSERT INTO supplyunitpricing VALUES (
    'supplier1',
    'leg',
    2
);

INSERT INTO supplyunitpricing VALUES (
    'supplier1',
    'table_top',
    7
);

INSERT INTO supplyunitpricing VALUES (
    'supplier1',
    'desk_top',
    11
);

INSERT INTO supplyunitpricing VALUES (
    'supplier2',
    'table',
    23
);

INSERT INTO supplyunitpricing VALUES (
    'supplier2',
    'desk',
    38
);

INSERT INTO supplyunitpricing VALUES (
    'supplier2',
    'leg',
    2
);

INSERT INTO supplyunitpricing VALUES (
    'supplier2',
    'table_top',
    6
);

INSERT INTO supplyunitpricing VALUES (
    'supplier2',
    'desk_top',
    10
);

INSERT INTO supplyunitpricing VALUES (
    'supplier3',
    'table',
    30
);

INSERT INTO supplyunitpricing VALUES (
    'supplier3',
    'desk',
    39
);

INSERT INTO supplyunitpricing VALUES (
    'supplier3',
    'leg',
    2
);

INSERT INTO supplyunitpricing VALUES (
    'supplier3',
    'table_top',
    8
);

INSERT INTO supplyunitpricing VALUES (
    'supplier3',
    'desk_top',
    10
);

INSERT INTO supplyunitpricing VALUES (
    'supplier4',
    'table',
    21
);

INSERT INTO supplyunitpricing VALUES (
    'supplier4',
    'desk',
    45
);

INSERT INTO supplyunitpricing VALUES (
    'supplier4',
    'leg',
    3
);

INSERT INTO supplyunitpricing VALUES (
    'supplier4',
    'table_top',
    4
);

INSERT INTO supplyunitpricing VALUES (
    'supplier4',
    'desk_top',
    15
);

DROP TABLE manufdiscounts CASCADE CONSTRAINTS;

CREATE TABLE manufdiscounts (
    manuf   CHAR(25),
    amt1    NUMBER(4),
    disc1   NUMBER(4),
    PRIMARY KEY ( manuf )
);

INSERT INTO manufdiscounts VALUES (
    'manufacturer1',
    500,
    0.05
);

INSERT INTO manufdiscounts VALUES (
    'manufacturer2',
    1000,
    0.10
);

DROP TABLE manufunitpricing;

CREATE TABLE manufunitpricing (
    manuf             CHAR(25),
    proditem          CHAR(9),
    setupcost         NUMBER(5),
    prodcostperunit   NUMBER(5),
    PRIMARY KEY ( manuf,
                  proditem ),
    FOREIGN KEY ( proditem )
        REFERENCES items ( item )
);

INSERT INTO manufunitpricing VALUES (
    'manufacturer1',
    'table',
    10,
    20
);

INSERT INTO manufunitpricing VALUES (
    'manufacturer1',
    'desk',
    8,
    32
);

INSERT INTO manufunitpricing VALUES (
    'manufacturer2',
    'table',
    15,
    19
);

INSERT INTO manufunitpricing VALUES (
    'manufacturer2',
    'desk',
    12,
    30
);

DROP TABLE shippingpricing;

CREATE TABLE shippingpricing (
    shipper           CHAR(9),
    fromloc           CHAR(9),
    toloc             CHAR(9),
    minpackageprice   NUMBER(5),
    priceperlb        NUMBER(9),
    amt1              NUMBER(9),
    disc1             NUMBER(9),
    amt2              NUMBER(9),
    disc2             NUMBER(9),
    PRIMARY KEY ( shipper,
                  fromloc,
                  toloc )
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'NYC',
    'NYC',
    20,
    1,
    100,
    0.05,
    500,
    0.15
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'NYC',
    'Boston',
    100,
    2,
    50,
    0.02,
    100,
    0.1
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'NYC',
    'DC',
    80,
    2,
    100,
    0.10,
    500,
    0.20
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'Boston',
    'NYC',
    90,
    1.5,
    60,
    0.05,
    150,
    0.10
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'Boston',
    'Boston',
    20,
    1,
    50,
    0.05,
    140,
    0.15
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'Boston',
    'DC',
    60,
    1.2,
    200,
    0.15,
    400,
    0.20
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'DC',
    'NYC',
    70,
    1.2,
    200,
    0.15,
    400,
    0.20
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'DC',
    'Boston',
    110,
    2,
    120,
    0.10,
    240,
    0.18
);

INSERT INTO shippingpricing VALUES (
    'Fedex',
    'DC',
    'DC',
    10,
    0.8,
    200,
    0.10,
    400,
    0.20
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'NYC',
    'NYC',
    20,
    1,
    100,
    0.1,
    500,
    0.2
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'NYC',
    'Boston',
    100,
    2,
    50,
    0.02,
    100,
    0.15
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'NYC',
    'DC',
    80,
    2,
    100,
    0.05,
    500,
    0.25
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'Boston',
    'NYC',
    90,
    1.5,
    60,
    0.02,
    150,
    0.15
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'Boston',
    'Boston',
    20,
    1,
    50,
    0.02,
    140,
    0.20
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'Boston',
    'DC',
    60,
    1.2,
    200,
    0.10,
    400,
    0.25
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'DC',
    'NYC',
    70,
    1.2,
    200,
    0.10,
    400,
    0.25
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'DC',
    'Boston',
    110,
    2,
    120,
    0.05,
    250,
    0.25
);

INSERT INTO shippingpricing VALUES (
    'UPS',
    'DC',
    'DC',
    10,
    0.8,
    200,
    0.05,
    400,
    0.25
);

DROP TABLE customerdemand;

CREATE TABLE customerdemand (
    customer   CHAR(9),
    item       CHAR(9),
    qty        NUMBER(5),
    PRIMARY KEY ( customer,
                  item ),
    FOREIGN KEY ( item )
        REFERENCES items ( item )
);

INSERT INTO customerdemand VALUES (
    'customer1',
    'table',
    50
);

INSERT INTO customerdemand VALUES (
    'customer1',
    'desk',
    100
);

INSERT INTO customerdemand VALUES (
    'customer2',
    'table',
    20
);

INSERT INTO customerdemand VALUES (
    'customer2',
    'desk',
    30
);

DROP TABLE supplyorders;

CREATE TABLE supplyorders (
    item       CHAR(9),
    supplier   CHAR(25),
    qty        NUMBER(5),
    PRIMARY KEY ( item,
                  supplier ),
    FOREIGN KEY ( item )
        REFERENCES items ( item ),
    FOREIGN KEY ( supplier )
        REFERENCES busentities ( entity )
);

INSERT INTO supplyorders VALUES (
    'table',
    'supplier1',
    10
);

INSERT INTO supplyorders VALUES (
    'desk',
    'supplier1',
    50
);

INSERT INTO supplyorders VALUES (
    'desk',
    'supplier2',
    20
);

INSERT INTO supplyorders VALUES (
    'leg',
    'supplier1',
    100
);

INSERT INTO supplyorders VALUES (
    'leg',
    'supplier2',
    100
);

INSERT INTO supplyorders VALUES (
    'leg',
    'supplier3',
    280
);

INSERT INTO supplyorders VALUES (
    'table_top',
    'supplier1',
    20
);

INSERT INTO supplyorders VALUES (
    'table_top',
    'supplier4',
    40
);

INSERT INTO supplyorders VALUES (
    'desk_top',
    'supplier2',
    50
);

INSERT INTO supplyorders VALUES (
    'desk_top',
    'supplier4',
    30
);

DROP TABLE manuforders;

CREATE TABLE manuforders (
    item    CHAR(9),
    manuf   CHAR(25),
    qty     NUMBER(6),
    PRIMARY KEY ( item,
                  manuf ),
    FOREIGN KEY ( item )
        REFERENCES items ( item ),
    FOREIGN KEY ( manuf )
        REFERENCES busentities ( entity )
);

INSERT INTO manuforders VALUES (
    'table',
    'manufacturer1',
    40
);

INSERT INTO manuforders VALUES (
    'table',
    'manufacturer2',
    20
);

INSERT INTO manuforders VALUES (
    'desk',
    'manufacturer1',
    30
);

INSERT INTO manuforders VALUES (
    'desk',
    'manufacturer2',
    50
);

DROP TABLE shiporders;

CREATE TABLE shiporders (
    item        CHAR(9),
    shipper     CHAR(9),
    sender      CHAR(25),
    recipient   CHAR(25),
    qty         NUMBER(6),
    PRIMARY KEY ( item,
                  shipper,
                  sender,
                  recipient ),
    FOREIGN KEY ( item )
        REFERENCES items ( item ),
    FOREIGN KEY ( sender )
        REFERENCES busentities ( entity ),
    FOREIGN KEY ( recipient )
        REFERENCES busentities ( entity )
);
 
  --for matItems(send to manufacturer)

INSERT INTO shiporders VALUES (
    'leg',
    'Fedex',
    'supplier1',
    'manufacturer1',
    100
);

INSERT INTO shiporders VALUES (
    'leg',
    'Fedex',
    'supplier3',
    'manufacturer1',
    100
);

INSERT INTO shiporders VALUES (
    'leg',
    'UPS',
    'supplier2',
    'manufacturer1',
    50
);

INSERT INTO shiporders VALUES (
    'table_top',
    'UPS',
    'supplier4',
    'manufacturer1',
    40
);

INSERT INTO shiporders VALUES (
    'desk_top',
    'Fedex',
    'supplier4',
    'manufacturer1',
    30
);

INSERT INTO shiporders VALUES (
    'leg',
    'UPS',
    'supplier2',
    'manufacturer2',
    230
);

INSERT INTO shiporders VALUES (
    'table_top',
    'Fedex',
    'supplier1',
    'manufacturer2',
    20
);

INSERT INTO shiporders VALUES (
    'desk_top',
    'UPS',
    'supplier2',
    'manufacturer2',
    50
);

  --for prodItems(send to customer)

INSERT INTO shiporders VALUES (
    'table',
    'Fedex',
    'manufacturer1',
    'customer1',
    40
);

INSERT INTO shiporders VALUES (
    'table',
    'Fedex',
    'supplier1',
    'customer1',
    10
);

INSERT INTO shiporders VALUES (
    'desk',
    'UPS',
    'manufacturer2',
    'customer1',
    50
);

INSERT INTO shiporders VALUES (
    'desk',
    'UPS',
    'supplier1',
    'customer1',
    50
);

INSERT INTO shiporders VALUES (
    'table',
    'Fedex',
    'manufacturer2',
    'customer2',
    20
);

INSERT INTO shiporders VALUES (
    'desk',
    'Fedex',
    'supplier2',
    'customer2',
    20
);

INSERT INTO shiporders VALUES (
    'desk',
    'Fedex',
    'manufacturer1',
    'customer2',
    30
);

DROP VIEW shippedvscustdemand;

CREATE VIEW shippedvscustdemand AS
    SELECT
        sup.customer,
        sup.item,
        sup.suppliedqty,
        dem.demandqty
    FROM
        (
            SELECT
                cu.customer,
                cu.item,
                SUM(sh.qty) suppliedqty
            FROM
                shiporders sh,
                customerdemand cu
            WHERE
                cu.customer = sh.recipient
                AND cu.item = sh.item
            GROUP BY
                cu.item,
                cu.customer
        ) sup
        JOIN (
            SELECT
                cu.customer,
                cu.item,
                SUM(cu.qty) demandqty
            FROM
                customerdemand cu
            GROUP BY
                cu.item,
                cu.customer
        ) dem ON sup.customer = dem.customer
                 AND sup.item = dem.item;

DROP VIEW totalmanufitems;

CREATE VIEW totalmanufitems AS
    SELECT
        m.item,
        SUM(m.qty) totalmanufqty
    FROM
        manuforders m
    GROUP BY
        m.item;

DROP VIEW matsusedvsshipped;

CREATE VIEW matsusedvsshipped AS
    SELECT
        req.manuf,
        req.matitem,
        req.requiredqty,
        ship.shippedqty
    FROM
        (
            SELECT
                m.manuf,
                b.matitem,
                SUM(b.qtymatperitem * m.qty) requiredqty
            FROM
                manuforders m,
                billofmaterials b
            WHERE
                m.item = b.proditem
            GROUP BY
                m.manuf,
                b.matitem
        ) req
        JOIN (
            SELECT
                m.manuf,
                b.matitem,
                SUM(DISTINCT sh.qty) shippedqty
            FROM
                manuforders m,
                billofmaterials b,
                shiporders sh
            WHERE
                m.manuf = sh.recipient
                AND sh.item = b.matitem
                AND m.item = b.proditem
            GROUP BY
                m.manuf,
                b.matitem
        ) ship ON req.manuf = ship.manuf
                  AND req.matitem = ship.matitem;

DROP VIEW producedvsshipped;

CREATE VIEW producedvsshipped AS
    SELECT
        ship.item,
        ship.manuf,
        ship.shippedoutqty,
        ord.orderedqty
    FROM
        (
            SELECT
                m.item,
                m.manuf,
                sh.sender,
                SUM(sh.qty) shippedoutqty
            FROM
                manuforders m,
                shiporders sh
            WHERE
                m.item = sh.item
                AND m.manuf = sh.sender
            GROUP BY
                m.item,
                m.manuf,
                sh.sender
        ) ship
        JOIN (
            SELECT
                m.item,
                m.manuf,
                SUM(m.qty) orderedqty
            FROM
                manuforders m
            GROUP BY
                m.item,
                m.manuf
        ) ord ON ship.item = ord.item
                 AND ship.sender = ord.manuf;

DROP VIEW suppliedvsshipped;

CREATE VIEW suppliedvsshipped AS
    SELECT
        ship.item,
        ship.supplier,
        ship.shippedoutqty,
        ord.orderedqty
    FROM
        (
            SELECT
                s.item,
                s.supplier,
                sh.sender,
                SUM(sh.qty) shippedoutqty
            FROM
                supplyorders s,
                shiporders sh
            WHERE
                s.item = sh.item
                AND s.supplier = sh.sender
            GROUP BY
                s.item,
                s.supplier,
                sh.sender
        ) ship
        JOIN (
            SELECT
                s.item,
                s.supplier,
                SUM(s.qty) orderedqty
            FROM
                supplyorders s
            GROUP BY
                s.item,
                s.supplier
        ) ord ON ship.item = ord.item
                 AND ship.sender = ord.supplier;

DROP VIEW persuppliercost;

CREATE VIEW persuppliercost AS
    SELECT
        sup.supplier,
        (
            CASE
                WHEN SUM(sup.ppu * so.qty) >= sd.amt2 THEN ( sd.amt1 + ( sd.amt2 - sd.amt1 ) * ( 1 - sd.disc1 ) + ( SUM(sup.ppu * so.qty) - sd.amt2 ) * ( 1 - sd.disc2 ) )
                WHEN SUM(sup.ppu * so.qty) > sd.amt1 THEN ( sd.amt1 + ( SUM(sup.ppu * so.qty) - sd.amt1 ) * ( 1 - sd.disc1 ) )
                ELSE SUM(sup.ppu * so.qty)
            END
        ) cost
    FROM
        supplierdiscounts sd,
        supplyorders so,
        supplyunitpricing sup
    WHERE
        sup.item = so.item
        AND sup.supplier = so.supplier
        AND sd.supplier = sup.supplier
    GROUP BY
        sup.supplier,
        sd.amt2,
        sd.amt1,
        sd.disc1,
        sd.disc2;

DROP VIEW permanufcost;

CREATE VIEW permanufcost AS
    SELECT
        mup.manuf,
        (
            CASE
                WHEN SUM(mup.setupcost + (mup.prodcostperunit * mo.qty) ) > md.amt1 THEN ( md.amt1 + ( SUM(mup.setupcost + (mup.prodcostperunit * mo.qty) ) - md.amt1 )
* ( 1 - md.disc1 ) )
                ELSE SUM(mup.setupcost + (mup.prodcostperunit * mo.qty) )
            END
        ) cost
    FROM
        manufdiscounts md,
        manuforders mo,
        manufunitpricing mup
    WHERE
        mup.proditem = mo.item
        AND mup.manuf = mo.manuf
        AND md.manuf = mup.manuf
    GROUP BY
        mup.manuf,
        md.amt1,
        md.disc1;

DROP VIEW pershippercost;

CREATE VIEW pershippercost AS
    SELECT DISTINCT
        shp1.shipper,
        SUM(DISTINCT totcost) cost
    FROM
        shippingpricing shp1,
        (
            SELECT DISTINCT
                (
                    CASE
                        WHEN SUM(shp.priceperlb * i.unitweight * sho.qty) > shp.amt2 THEN (
                            CASE
                                WHEN shp.minpackageprice > ( shp.amt1 + ( shp.amt2 - shp.amt1 ) * ( 1 - shp.disc1 ) + ( SUM(shp.priceperlb * i.unitweight * sho.qty) - shp.amt2 ) * ( 1 - shp.disc2
) ) THEN shp.minpackageprice
                                ELSE ( shp.amt1 + ( shp.amt2 - shp.amt1 ) * ( 1 - shp.disc1 ) + ( SUM(shp.priceperlb * i.unitweight * sho.qty) - shp.amt2 ) * ( 1 - shp.disc2 ) )
                            END
                        )
                        WHEN SUM(shp.priceperlb * i.unitweight * sho.qty) > shp.amt1 THEN (
                            CASE
                                WHEN shp.minpackageprice > ( shp.amt1 + ( SUM(shp.priceperlb * i.unitweight * sho.qty) - shp.amt1 ) * ( 1 - shp.disc1 ) ) THEN shp.minpackageprice
                                ELSE ( shp.amt1 + ( SUM(shp.priceperlb * i.unitweight * sho.qty) - shp.amt1 ) * ( 1 - shp.disc1 ) )
                            END
                        )
                        ELSE (
                            CASE
                                WHEN shp.minpackageprice > SUM(shp.priceperlb * i.unitweight * sho.qty) THEN shp.minpackageprice
                                ELSE SUM(shp.priceperlb * i.unitweight * sho.qty)
                            END
                        )
                    END
                ) totcost,
                shp.shipper
            FROM
                shippingpricing shp,
                shiporders sho,
                items i,
                busentities be,
                busentities be2
            WHERE
                i.item = sho.item
                AND shp.shipper = sho.shipper
                AND sho.sender = be.entity
                AND be.shiploc = shp.fromloc
                AND sho.recipient = be2.entity
                AND be2.shiploc = shp.toloc
            GROUP BY
                shp.shipper,
                shp.amt1,
                shp.disc1,
                shp.amt2,
                shp.disc2,
                shp.minpackageprice
        ) ship2
    WHERE
        ship2.shipper = shp1.shipper
    GROUP BY
        shp1.shipper;

DROP VIEW totalcostbreakdown;

CREATE VIEW totalcostbreakdown AS
    SELECT
        *
    FROM
        (
            SELECT
                SUM(sc.cost) supplycost
            FROM
                persuppliercost sc
        ),
        (
            SELECT
                SUM(mc.cost) manufcost
            FROM
                permanufcost mc
        ),
        (
            SELECT
                SUM(shc.cost) shippingcost
            FROM
                pershippercost shc
        );

/*
1. Find customers, whose demand is NOT satisfied, i.e., are
not shipped all the quantities of items
2. Find suppliers, whose ers are not fully shipped out
3. Find manufacturers who do NOT have enough materials to
produce ordered product quantities, i.e., not enough
materials were shipped to them
4. Find manufacturers whose orders are not fully shipped out
*/

/*
1. Find customers, whose demand is NOT satisfied, i.e., are
not shipped all the quantities of items
*/

SELECT
    cu.customer
FROM
    customerdemand cu,
    shiporders sho
WHERE
    cu.qty > ALL (
        SELECT
            SUM(sho.qty)
        FROM
            shiporders sho
        WHERE
            sho.recipient = cu.customer
            AND sho.item = cu.item
    );

/*
2. Find suppliers, whose orders are not fully shipped out
*/

SELECT DISTINCT
    so.supplier
FROM
    supplyorders so,
    shiporders sho
WHERE
    so.qty > ANY (
        SELECT
            SUM(sho.qty)
        FROM
            shiporders sho
        WHERE
            sho.recipient = so.supplier
            AND sho.item = so.item
    )
    OR so.supplier = ANY (
        SELECT
            sho.recipient
        FROM
            shiporders sho
        WHERE
            sho.recipient != so.supplier
    );

/*
3. Find manufacturers who do NOT have enough materials to
produce ordered product quantities, i.e., not enough
materials were shipped to them
*/

SELECT DISTINCT
    mo.manuf
FROM
    manuforders mo,
    shiporders sho
WHERE
    mo.item = sho.item
    AND mo.manuf = sho.recipient
    AND mo.qty != sho.qty;

/*
4. Find manufacturers whose orders are not fully shipped out
*/

SELECT DISTINCT
    mo.manuf
FROM
    manuforders mo,
    shiporders sho
WHERE
    mo.item = sho.item
    AND mo.manuf = sho.sender
    AND mo.qty != sho.qty;