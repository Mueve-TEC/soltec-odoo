# Módulos extra de odoo a instalar en la imagen

## Módulo de contabilidad de odoo community y otros módulos de ODOO Mates

Se incluye el repositorio de odoo mates, que incluye los módulos necesarios para la contabilidad de la versión Odoo community
<https://github.com/odoomates/odooapps.git>

> `git submodule add -b 16.0 https://github.com/odoomates/odooapps.git`

Nos interesan los módulos:

- accounting_pdf_reports
- om_account_daily_reports
- om_account_accountant
- om_account_followup
- om_account_asset
- om_fiscal_year
- om_account_bank_statement_import
- om_recurring_payments
- om_account_budget

## Factura electrónica

> `git submodule add -b 16.0 https://github.com/Mueve-TEC/odoo-argentina.git`

Modulo de facturación electrónica basado en el desarrollo de A2systems, con mejoras y mantenido por Mueve.

Para su instalación se sigue el instuctivo de <https://a2systems.co/blog/blog-2/instalacion-de-la-localizacion-argentina-odoo16-5>. Además, para su correcto funcionamiento es necesario utilizar la versión de la libreria PyAfipWS mantenida por Mueve, en particular la rama py3k que se encuentra en: <https://github.com/Mueve-TEC/pyafipws/tree/py3k>.

Tambén se instalan las dependencias:

> `git submodule add -b 16.0 https://github.com/ingadhoc/account-financial-tools.git`
> `git submodule add -b 16.0 https://github.com/ingadhoc/account-payment.git`

## Conciliación bancaria

Se incluye el módulo account reconcile <https://github.com/OCA/account-reconcile/tree/16.0> que permite realizar conciliaciones bancarias.

> `git submodule add -b 16.0 https://github.com/OCA/account-reconcile.git`

Incluye los módulos

- account_mass_reconcile
- account_move_base_import
- account_move_line_reconcile_manual
- account_move_reconcile_forbid_cancel
- account_move_so_import
- account_reconcile_oca
- account_statement_base
- base_transaction_id

Se incluyen los **requirements.txt**

## Importación de extractos bancarios

<https://github.com/OCA/bank-statement-import/tree/16.0>

Para la importación de extractos bancarios es necesario incluir algunos paquetes.

> `git submodule add -b 16.0 https://github.com/OCA/bank-statement-import.git`

Incluye los módulos

- account_mass_reconcile
- account_move_base_import
- account_move_line_reconcile_manual
- account_move_reconcile_forbid_cancel
- account_move_so_import
- account_reconcile_oca
- account_statement_base
- base_transaction_id

Se incluyen los **requirements.txt**

## Membership extension

This module extends Odoo's membership management. Ver:

<https://github.com/OCA/vertical-association/tree/16.0/membership_extension>

Para incorporar este módulo es necesario traer todo el repo, pero sólo nos interesa el módulo

- membership_extension

Para incorporar todo el módulo

> `git submodule add -b 16.0 https://github.com/OCA/vertical-association.git`

## Helpdesk

Incluye los módulos

- helpdesk_mgmt  
- helpdesk_mgmt_merge  
- helpdesk_mgmt_portal_follower  
- helpdesk_mgmt_project  
- helpdesk_mgmt_rating  
- helpdesk_mgmt_timesheet  
- helpdesk_motive  
- helpdesk_portal_priority  
- helpdesk_portal_restriction  
- helpdesk_product  
- helpdesk_ticket_close_inactive  
- helpdesk_ticket_open_tab  
- helpdesk_ticket_partner_response  
- helpdesk_ticket_related  
- helpdesk_type  

Para incorporar todo el módulo

> `git submodule add -b 16.0 https://github.com/OCA/helpdesk.git`

## Odoo Union

Conjunto de modulos para sindicatos

- union_affiliation  
- union_benefit_request  
- union_contribution  
- union_school_position  

Para incorporar todo el módulo

> `git submodule add -b 16.0 https://github.com/Mueve-TEC/odoo-union.git`

## Payment_sipago

Módulo desarrollado por Mueve que permite integrar Sipago como método de pago en las ventas realizadas a través del comercio electrónico (sitio web) de Odoo.

Para incorporar todo el módulo

> `git submodule add -b 16.0 https://github.com/Mueve-TEC/payment_sipago.git`

## Apéndice: Utilización de submódulos

Ver referencia en <https://github.blog/2016-02-01-working-with-submodules/>

### Para clonar el repositorio y todos los submódulos

> `git clone --recursive <project url>`

### Para agregar un nuevo submódulo al repositorio

> `cd submodules/`
> `git submodule add -b 16.0 https://github.com/<user>/XXXX`

Por ejemplo <https://github.com/OCA/account-reconcile.git>

> `git commit -m "submodulo XXX agregado"`
> `git submodule update --init --recursive`

### Para actualizar los submódulos al último commit

> `git submodule update --remote --merge`

### Para actualizar un sólo submódulo al último commit

> `git submodule update --remote --merge <path-to-submodule>`
