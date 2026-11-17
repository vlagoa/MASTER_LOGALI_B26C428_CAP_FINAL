using {SalesOrdersService as p} from '../salesorders-service';


annotate p.SalesOrderItems with {
    name             @title: '{i18n>name}'             @Common.FieldControl: #Mandatory;
    description      @title: '{i18n>description}'      @Common.FieldControl: #Mandatory;
    releasedate      @title: '{i18n>releaseDate}';
    discontinueddate @title: '{i18n>discontinuedDate}';
    quantity         @title: '{i18n>quantity}'         @Common.FieldControl: #Mandatory;
    price            @title: '{i18n>price}'            @Common.FieldControl: #Mandatory;
    width            @title: '{i18n>width}';
    height           @title: '{i18n>height}';
    depth            @title: '{i18n>depth}';
    unitofmeasure    @title: '{i18n>unitOfMeasure}';
};

annotate p.SalesOrderItems with @(

    // 1. Encabezado de la ficha individual del ítem
    UI.HeaderInfo             : {
        TypeName       : '{i18n>salesOrderItem}',
        TypeNamePlural : '{i18n>orderItems}',
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
        Label  : '{i18n>itemDetails}'
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
