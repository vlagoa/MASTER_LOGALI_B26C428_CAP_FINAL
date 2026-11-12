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
    UI.FieldGroup #ItemDetails: {
        $type: 'UI.FieldGroupType',
        Data : [
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
        },
        ]
    }
);
