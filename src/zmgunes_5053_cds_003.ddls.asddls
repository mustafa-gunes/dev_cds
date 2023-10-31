@AbapCatalog.sqlViewName: 'ZMGUNES_5053_V03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Ödev 2-2'
define view ZMGUNES_5053_CDS_003
  as select from zmgunes_5053_v02 as cds
    inner join   vbrk on vbrk.vbeln = cds.vbeln
{
  cds.vbeln,
  cast(sum(cds.conversion_netwr) as abap.fltp)                                             as toplam_net_deger,
  cds.kunnrad                                                                              as musteri_ad_soyad,
  count( * )                                                                               as toplam_fatura_adedi,
  ( cast( sum(cds.conversion_netwr) as abap.fltp ) ) / ( cast( count( * ) as abap.fltp ) ) as ortalama_miktar,
  substring(cds.fkdat, 1, 4)                                                               as faturalama_yili,
  substring(cds.fkdat, 5, 2)                                                               as faturalama_ayi,
  substring(cds.fkdat, 7, 2)                                                               as faturalama_gunu,
  substring(vbrk.inco2_l, 1, 3)                                                            as incoterm_yeri
}
group by
  cds.vbeln,
  cds.kunnrad,
  cds.fkdat,
  vbrk.inco2_l
