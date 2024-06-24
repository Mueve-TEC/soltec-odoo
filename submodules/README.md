# Módulos extra de odoo a instalar en la imagen

## Módulo de contabilidad de odoo community y otros módulos de ODOO Mates

Se incluye el repositorio de odoo mates, que incluye los módulos necesarios para la contabilidad de la versión Odoo community
https://github.com/odoomates/odooapps.git

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

> `git submodule add -b 16.0 https://github.com/a2systems/odoo-argentina.git`

Se sigue el instuctivo de <https://a2systems.co/blog/blog-2/instalacion-de-la-localizacion-argentina-odoo16-5>


Tambén se instalan las dependencias

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

https://github.com/OCA/bank-statement-import/tree/16.0

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

https://github.com/OCA/vertical-association/tree/16.0/membership_extension


Para incorporar este módulo es necesario traer todo el repo, pero sólo nos interesa el módulo

- membership_extension

Para incorporar todo el módulo 

> `git submodule add -b 16.0 https://github.com/OCA/vertical-association.git`


# Apéndice: Utilización de submódulos

Ver referencia en <https://github.blog/2016-02-01-working-with-submodules/>


### Para clonar el repositorio y todos los submódulos

> `git clone --recursive <project url>`

### Para agregar un nuevo submódulo al repositorio


> `cd submodules/`

> `git submodule add -b 16.0 https://github.com/<user>/XXXX`

Por ejemplo https://github.com/OCA/account-reconcile.git

> `git commit -m "submodulo XXX agregado"`

> `git submodule update --init --recursive`



### Para actualizar los submódulos al último commit

> `git submodule update --remote --merge`

### Para actualizar un sólo submódulo al último commit

> `git submodule update --remote --merge <path-to-submodule>`



