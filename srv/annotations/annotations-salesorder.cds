using SalesOrdersService as s from '../salesorders-service';

annotate s.SalesOrdersHeader with {
salesOrderNumber @title : 'Sale Order Number';
mail @title : 'Email';
firstname @title : 'First Name';
lastname @title : 'Last Name';
country  @title : 'Country'      @Common.Text : country.name      @Common.TextArrangement : #TextOnly;     
createon @title : 'Creation Date';
deliverydate @title : 'Delivery Date';
orderstatus @title : 'Order Status'  @Common.Text : orderstatus.name  @Common.TextArrangement : #TextOnly;    
imageurl
};


annotate s.SalesOrdersHeader @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: salesOrderNumber,
    },
    {
        $Type: 'UI.DataField',
        Value: mail,
    },
    {
        $Type: 'UI.DataField',
        Value: firstname,
    },
    {
        $Type: 'UI.DataField',
        Value: lastname,
    },
    {
        $Type: 'UI.DataField',
        Value: country_code, 
    },
    {
        $Type: 'UI.DataField',
        Value: createon,
    },
    {
        $Type: 'UI.DataField',
        Value: deliverydate,
    },
    {
        $Type: 'UI.DataField',
        Value: orderstatus_code,
    },
    {
        $Type: 'UI.DataField',
        Value: imageurl,
    },
],

);

// Mapeo para que Fiori Elements reemplace el código numérico por el texto traducido
annotate s.Status with @(
    Common.Text            : name,
    Common.TextArrangement : #TextOnly
);

annotate s.Countries with @(
    Common.Text            : name,
    Common.TextArrangement : #TextOnly
);