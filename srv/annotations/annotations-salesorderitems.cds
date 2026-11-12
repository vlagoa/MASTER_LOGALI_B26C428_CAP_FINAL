using {SalesOrdersService as p} from '../salesorders-service';


annotate p.SalesOrderItems with {
    name             @title: 'Name';
    description      @title: 'Description';
    releasedate      @title: 'Release Date';
    discontinueddate @title: 'Discontinued Date';
    quantity         @title: 'Quantity';
    price            @title: 'Price';
    width            @title: 'Width';
    height           @title: 'Height';
    depth            @title: 'Depth';
    unitofmeasure    @title: 'Unit of Measure';
};

annotate p.SalesOrderItems with @(

    // 1. Encabezado de la ficha individual del ítem
    UI.HeaderInfo             : {
        TypeName      : 'Sales Order Item',
        TypeNamePlural: 'Sales Order Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },

    // 2. Sección que pinta el formulario de abajo al entrar a un ítem
    UI.Facets                 : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#ItemDetails',
        Label : 'Item Details'
    }],

    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Value: quantity,
        },
        {
            $Type: 'UI.DataField',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Value: width,
        },
        {
            $Type: 'UI.DataField',
            Value: height,
        },
        {
            $Type: 'UI.DataField',
            Value: depth,
        },
        {
            $Type: 'UI.DataField',
            Value: unitofmeasure,
        }
    ],
    UI.FieldGroup #ItemDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: description
            },
            {
                $Type: 'UI.DataField',
                Value: releasedate
            },
            {
                $Type: 'UI.DataField',
                Value: discontinueddate
            },
            {
                $Type: 'UI.DataField',
                Value: quantity
            },
            {
                $Type: 'UI.DataField',
                Value: price
            },
            {
                $Type: 'UI.DataField',
                Value: width
            },
            {
                $Type: 'UI.DataField',
                Value: height
            },
            {
                $Type: 'UI.DataField',
                Value: depth
            },
            {
                $Type: 'UI.DataField',
                Value: unitofmeasure
            }
        ]
    }
);
