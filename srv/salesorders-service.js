import cds from '@sap/cds';

export default cds.service.impl(async function () {
    const { SalesOrdersHeader } = this.entities;

 // 1. Muestra el texto provisional y la fecha actual mientras creas el borrador
    this.before('NEW', SalesOrdersHeader.drafts, async (req) => {
        const isSpanish = req.locale && req.locale.toLowerCase().startsWith('es');
        req.data.salesOrderNumber = isSpanish ? 'Nueva Ord.' : 'New Order';
        req.data.createon = new Date().toISOString().split('T')[0];
    });

    // 2. Asigna el correlativo definitivo (ej: SO-1003) justo cuando pulsas "Guardar"
    this.before('CREATE', SalesOrdersHeader, async (req) => {
        const existingOrders = await SELECT.from(SalesOrdersHeader).columns('salesOrderNumber');

        let maxNum = 1000;
        for (const order of existingOrders) {
            if (order.salesOrderNumber && order.salesOrderNumber.startsWith('SO-')) {
                const num = parseInt(order.salesOrderNumber.replace('SO-', ''), 10);
                if (!isNaN(num) && num > maxNum) {
                    maxNum = num;
                }
            }
        }

        req.data.salesOrderNumber = `SO-${maxNum + 1}`;
    });

   // 3. UPDATE: Valida campos obligatorios al modificar la orden (PDF 2.2 y 4.1)
    this.before('UPDATE', SalesOrdersHeader, async (req) => {
        if (req.data.mail !== undefined && !req.data.mail) {
            req.error(400, 'El campo Email es obligatorio al modificar la orden.', 'mail');
        }
    });

    // 4. DELETE: Control de eliminación de orden de venta (PDF 2.3)
    this.before('DELETE', SalesOrdersHeader, async (req) => {
        console.log(`Eliminando orden con ID: ${req.data.ID}`);
    });

});