namespace com.salesorders;

// Importamos el aspecto cuid del framework de CAP
using {
    cuid, // Reemplaza el UUID por cuid para generar identificadores únicos
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

entity SalesOrderHeader : cuid, managed {
    key email        : String(30);
        firstname    : String(30);
        lastname     : String(30);
        country      : Association to Countries;
        createon     : Date;
        deliverydate : DateTime;
        orderstatus  : Integer;
        imageurl     : String;

        // Composición para vincular la cabecera con sus ítems
        items        : Composition of many SalesOrderItems
                           on items.header = $self;
}

entity SalesOrderItems : cuid {
    header           : Association to SalesOrderHeader;
    name             : String(40);
    description      : String(40);
    releasedate      : Date;
    discontinueddate : Date;
    price            : Decimal(12, 2);
    height           : Decimal(15, 3);
    width            : Decimal(13, 3);
    depth            : Decimal(12, 2);
    quantity         : Decimal(16, 2);
    unitofmeasure    : String;
}

// Definimos la entidad Countries heredando de CodeList de SAP
entity Countries : CodeList {
    key code : String(3); // Ejemplo: 'ESP', 'ARG', 'USA'
}
