using SalesOrdersService as s from '../salesorders-service';
using from './annotations-salesorderitems';

annotate s.SalesOrdersHeader with @odata.draft.enabled;

annotate s.SalesOrdersHeader with {
    salesOrderNumber @title: '{i18n>salesOrderNumber}' @Common.FieldControl: #ReadOnly;
    mail             @title: '{i18n>mail}' @Common.FieldControl: #Mandatory;
    firstname        @title: '{i18n>firstName}' @Common.FieldControl: #Mandatory;
    lastname         @title: '{i18n>lastName}' @Common.FieldControl: #Mandatory;
    country          @title: '{i18n>country}'      @Common.Text: country.name      @Common.TextArrangement: #TextOnly;
    createon         @title: '{i18n>createOn}' @Common.FieldControl: #ReadOnly;
    deliverydate     @title: '{i18n>deliveryDate}';
    orderstatus      @title: '{i18n>orderStatus}' 
     @Common.Text: orderstatus.name  @Common.TextArrangement: #TextOnly
     @Common.FieldControl: #Mandatory;
    imageurl         @title: '{i18n>imageUrl}' @UI.IsImageURL;
};


annotate s.SalesOrdersHeader @(
    UI.SelectionFields      : [
        salesOrderNumber,
        country,
        orderstatus_code,
        lastname,
        deliverydate,
        country_code,
    ],

    UI.HeaderInfo           : {
        $type         : 'UI.HeaderInfoType',
    TypeName       : '{i18n>salesOrderHeader}',
    TypeNamePlural : '{i18n>salesOrderHeaders}',
        ImageUrl       : imageurl,
        Title         : {
            $type: 'UI.DataField',
            Value: salesOrderNumber,
        },
        Description   : {
            $type: 'UI.DataField',
            Value: orderstatus_code,
        },
    },

    UI.LineItem             : [
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
            Value: orderstatus_code,
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
            Value: imageurl,
        },
    ],
    UI.FieldGroup #Recipient: {
        $type: 'UI.FieldGroupType',
        Data : [
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
                Value: mail,
            },
            {
                $Type: 'UI.DataField',
                Value: country_code,
            },
        ]
    },

    UI.FieldGroup #Data     : {
        $type: 'UI.FieldGroupType',
        Data : [

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
                Value: imageurl,
            },            
        ]
    },
    UI.HeaderFacets         : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Recipient',
        Label  : '{i18n>recipient}'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Data',
        Label  : '{i18n>orderDates}'
    }
    ],
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        Target: 'items/@UI.LineItem',
        //'items/@UI.FieldGroup#ItemDetails',
         Label  : '{i18n>orderItems}'
    }]
);

// Mapeo para que Fiori Elements reemplace el código numérico por el texto traducido
annotate s.Status with @(
    Common.Text           : name,
    Common.TextArrangement: #TextOnly
);

annotate s.Countries with @(
    Common.Text           : name,
    Common.TextArrangement: #TextOnly
);
