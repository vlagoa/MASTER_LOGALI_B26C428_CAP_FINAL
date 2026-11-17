import cds from '@sap/cds';

export default cds.service.impl(async function () {
    const { SalesOrdersHeader, SalesOrderItems } = this.entities;


    // Función auxiliar para validar formato de correo electrónico
    const isValidEmail = (email) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
	};
 // 1. Muestra el texto provisional y la fecha actual mientras creas el borrador
    this.before('NEW', SalesOrdersHeader.drafts, async (req) => {
        const isSpanish = req.locale && req.locale.toLowerCase().startsWith('es');
        req.data.salesOrderNumber = isSpanish ? 'Nueva Ord.' : 'New Order';
        req.data.createon = new Date().toISOString().split('T')[0];
        req.data.orderstatus_code = '1'; // Código '1' = Abierto por defecto
    });

    // 2. Asigna el correlativo definitivo (ej: SO-1003) justo cuando pulsas "Guardar"
    this.before('CREATE', SalesOrdersHeader, async (req) => {
        if (!req.data.mail || req.data.mail.trim() === '') {
            return req.error(400, 'El campo Email es obligatorio al crear la orden.', 'mail');
        }
        if (!isValidEmail(req.data.mail)) {
            return req.error(400, 'El formato del correo electrónico no es válido (ej. usuario@dominio.com).', 'mail');
        }

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
      if (req.data.mail !== undefined) {
            if (!req.data.mail || req.data.mail.trim() === '') {
                return req.error(400, 'El campo Email es obligatorio al modificar la orden.', 'mail');
            }
            if (!isValidEmail(req.data.mail)) {
                return req.error(400, 'El formato del correo electrónico no es válido (ej. usuario@dominio.com).', 'mail');
            }
        }
    });

    // 4. DELETE: Control de eliminación de orden de venta (PDF 2.3)
    this.before('DELETE', SalesOrdersHeader, async (req) => {
        console.log(`Eliminando orden con ID: ${req.data.ID}`);
    });

        // 5. Validaciones CUD para las líneas de pedido (SalesOrderItems)
    this.before(['CREATE', 'UPDATE'], SalesOrderItems, async (req) => {
        if (req.data.quantity !== undefined && req.data.quantity <= 0) {
            req.error(400, 'La cantidad del ítem debe ser mayor a 0.', 'quantity');
        }
        if (req.data.price !== undefined && req.data.price < 0) {
            req.error(400, 'El precio del ítem no puede ser negativo.', 'price');
        }
    });

});