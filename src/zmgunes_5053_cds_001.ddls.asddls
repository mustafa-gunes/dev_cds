@AbapCatalog.sqlViewName: 'ZMGUNES_5053_V01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Örnek'
define view ZMGUNES_5053_CDS_001
  as select from    ekko
    inner join      ekpo on ekko.ebeln = ekpo.ebeln
    inner join      mara on mara.matnr = ekpo.matnr
    left outer join makt on  makt.matnr = mara.matnr
                         and makt.spras = $session.system_language
    inner join      lfa1 on lfa1.lifnr = ekko.lifnr
{
  key   ekpo.ebeln,
  key   ekpo.ebelp,
        ekpo.matnr,
        makt.maktx,
        ekpo.werks,
        ekpo.lgort,
        ekpo.meins,
        lfa1.lifnr,
        lfa1.name1,
        concat_with_space( lfa1.stras, lfa1.mcod3, 1 ) as satici_adresi
}
