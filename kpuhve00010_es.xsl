<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="iso-8859-1"/>
	<!-- <xsl:include href="/atcl_es_web_pub/funciones.xsl"/> -->
	
	<xsl:template match="CONTEXTO">
	
	<xsl:variable name="ventana" select="ARQUITECTURA/VENTANA"/> 	
	<xsl:variable name="flujoid" select="ARQUITECTURA/FLUJOID"/> 	
	<xsl:variable name="destino_formulario" select="ARQUITECTURA/DESTINO_FORMULARIO"/>
	<xsl:variable name="idpeticionpesada" select="ARQUITECTURA/IDPETICIONPESADA"/>
	
	<xsl:variable name="modo_msg" select="ARQUITECTURA/PAG_MODO_MSG"/>
	<xsl:variable name="servicio_ok" select="ARQUITECTURA/CTE_SERVICIO_OK"/>
	<xsl:variable name="paramErrores" select="ARQUITECTURA/PARAMERRORES"/>
	<xsl:variable name="mensajeError" select="ARQUITECTURA/PAG_MODO_MSG"/>
	
	<xsl:variable name="COD_BCOTERMI" select="normalize-space(SERV_PRESENTACION/COD_BCOTERMI)"/>
	<xsl:variable name="COD_OFITERMI" select="normalize-space(SERV_PRESENTACION/COD_OFITERMI)"/>
	<xsl:variable name="XTI_TIPINGR" select="substring(normalize-space(SERV_PRESENTACION/XTI_TIPINGR),2)"/>
	<xsl:variable name="XTI_TIPABONO" select="normalize-space(SERV_PRESENTACION/XTI_TIPABONO)"/>
	<xsl:variable name="COD_DIISOALF" select="normalize-space(SERV_PRESENTACION/COD_DIISOALF)"/>
	<xsl:variable name="IMP_REMES" select="normalize-space(SERV_PRESENTACION/IMP_REMES)"/>
	<xsl:variable name="COD_BCOABON" select="normalize-space(SERV_PRESENTACION/COD_BCOABON)"/>
	<xsl:variable name="COD_OFIABON" select="normalize-space(SERV_PRESENTACION/COD_OFIABON)"/>
	<xsl:variable name="COD_DCABON" select="normalize-space(SERV_PRESENTACION/COD_DCABON)"/>
	<xsl:variable name="COD_CTAABON" select="normalize-space(SERV_PRESENTACION/COD_CTAABON)"/>
	<xsl:variable name="DES_OBSERV" select="normalize-space(SERV_PRESENTACION/DES_OBSERV)"/>
	<xsl:variable name="XTI_IMPDOCUM" select="normalize-space(SERV_PRESENTACION/XTI_IMPDOCUM)"/>
	<xsl:variable name="FEC_ENTREGA" select="normalize-space(SERV_PRESENTACION/FEC_ENTREGA)"/>
	<xsl:variable name="COD_REFCLIEN" select="normalize-space(SERV_PRESENTACION/COD_REFCLIEN)"/>
	<xsl:variable name="COD_TARIFA" select="normalize-space(SERV_PRESENTACION/COD_TARIFA)"/>
	<xsl:variable name="estado_titular" select="normalize-space(SERV_PRESENTACION/ESTADO_TITULAR)"/>

	<xsl:variable name="ORIGEN" select="normalize-space(SERV_PRESENTACION/ORIGEN)"/>
	<xsl:variable name="XSN_CONSULTAOK" select="normalize-space(SERV_PRESENTACION/XSN_CONSULTAOK)"/>	
	
	<xsl:variable name="error_fecha" select="normalize-space(SERV_PRESENTACION/ERROR_FECHA)"/>
	<xsl:variable name="error_cuenta" select="normalize-space(SERV_PRESENTACION/ERROR_CUENTA)"/>
	<xsl:variable name="error_refe" select="normalize-space(SERV_PRESENTACION/ERROR_REFE)"/>
	<xsl:variable name="error_banco" select="normalize-space(SERV_PRESENTACION/ERROR_BANCO)"/>
	<xsl:variable name="cod_lupa" select="normalize-space(SERV_PRESENTACION/COD_LUPA)"/>
	
	<!-- C�BICO - Septiembre 2017. Variables salida consulta cuentas KGCTT918 -->
	<xsl:variable name="cod_bco_interno" select="SERV_PRESENTACION/COD_BCO_INTERNO"/>
	<xsl:variable name="cod_ofi_interno" select="SERV_PRESENTACION/COD_OFI_INTERNO"/>
	<xsl:variable name="cod_contrap_interno" select="SERV_PRESENTACION/COD_CONTRAP_INTERNO"/>
	<xsl:variable name="cod_folio_interno" select="SERV_PRESENTACION/COD_FOLIO_INTERNO"/>
	<xsl:variable name="cod_ctaextno_s" select="SERV_PRESENTACION/COD_CTAEXTNO_S"/>
	<xsl:variable name="CUBICO" select="normalize-space(SERV_PRESENTACION/CUBICO)"/>	
	
<html class="HtmlPagina">
<head>
	<title>Acuse de Recibo Remesas de Compensaci�n</title>	
	<xsl:if test="normalize-space($idpeticionpesada)!='null' and normalize-space($idpeticionpesada)!=''">
  	<div style="position:absolute; top:0px; left:0px;">
			<object ID="PlugIn" WIDTH="1" HEIGHT="1" HSPACE="1" VSPACE="1" CLASSID="CLSID:E3C2C239-F164-4808-BB48-FC77AFD35E48">
				<param name="IdComm" value="{$idpeticionpesada}"/>
      </object>
		</div>		
	</xsl:if>
  

<script type="text/javaScript" src="/atcl_es_web_pub/js/utils.js"/>
<script language="JavaScript" type="text/javascript">versionCss='02'</script>  
<script language="JavaScript" type="text/javascript" src="/ncsc_es_web_pub/js/ncscCarga.js"/>
<script type="text/javaScript" src="/kpuh_es_web_pub/js/export_kpuh_tecnocom.js"/>
<script type="text/javaScript" src="/kpuh_es_web_pub/js/kpuhve00010.js"/>

</head>

<!--<body class="BodyPagina" onload="inicial();compruebaError();" onresize="" style="" >-->
<body class="BodyPagina" onload="inicial();situarFoco()" scroll="no" onmousedown="controlEvento(event);">
   <!--<xsl:if test="MENSAJES='true'">-->
	<xsl:if test="ARQUITECTURA/PAG_MODO_MSG != ARQUITECTURA/CTE_SERVICIO_OK">
		<xsl:attribute name="onload">
			inicial();compruebaError();document.forms[0].disabled=true;
			mostrarMensajes(<xsl:value-of select="ARQUITECTURA/TIPOMENSAJE"/>,
							<xsl:value-of select="ARQUITECTURA/PARAMERRORES"/>);
		</xsl:attribute>
	</xsl:if>

	<form NAME="KPUHVE00010" ACTION="{$destino_formulario}" METHOD="POST" class="FormPagina">
 			
			<input type="hidden" name="TITULO" id="TITULO" value=""/>
			<input type="hidden" name="IDPETICIONPESADA" id="IDPETICIONPESADA" value="{$idpeticionpesada}"/>
			<input type="hidden" name="evento"/>
			<input TYPE="hidden" name="eventoLanzado" value="0"/>
			<input type="hidden" name="flujo" value="{$flujoid}"/>
			<input type="hidden" name="ventana" value="{$ventana}"/>
 		
			<input type="hidden" name="camino"/>
			<input type="hidden" name="COD_BCOTERMI" id="COD_BCOTERMI" value="{$COD_BCOTERMI}"/>
			<input type="hidden" name="COD_OFITERMI" id="COD_OFITERMI" value="{$COD_OFITERMI}"/>
			<input type="hidden" name="hCOD_BCOABON" id="hCOD_BCOABON" value="{$COD_BCOABON}"/>
			<input type="hidden" name="hCOD_OFIABON" id="hCOD_OFIABON" value="{$COD_OFIABON}"/>
			
			<input type="hidden" name="hCOD_DCABON" id="hCOD_DCABON" value="{$COD_DCABON}"/>
			<input type="hidden" name="hCOD_CTAABON" id="hCOD_CTAABON" value="{$COD_CTAABON}"/>
			<input type="hidden" name="hDES_OBSERV" id="hDES_OBSERV" value="{$DES_OBSERV}"/>
			<input type="hidden" name="hIMP_REMES" id="hIMP_REMES" value="{$IMP_REMES}"/>
			<input type="hidden" name="HD_IMP_REMES" id="HD_IMP_REMES" value=""/>
			<input type="hidden" name="HD_IMP_EUROS" id="HD_IMP_EUROS" value=""/>
			<input type="hidden" name="HD_IMP_LINEA_EUROS" id="HD_IMP_LINEA_EUROS" value=""/>
			<input type="hidden" name="HD_IMP_REMES_FORM" id="HD_IMP_REMES_FORM" value=""/>
			
			<input type="hidden" name="XTI_TIPINGR" id="XTI_TIPINGR" value="{$XTI_TIPINGR}"/>	
			<input type="hidden" name="DES_TIPINGR" id="DES_TIPINGR" value=""/>
			<input type="hidden" name="hXTI_TIPABONO" id="hXTI_TIPABONO" value="{$XTI_TIPABONO}"/>	
		 	<input type="hidden" name="hCOD_DIISOALF" id="hCOD_DIISOALF" value="{$COD_DIISOALF}"/>	
		 	<input type="hidden" name="hXTI_IMPDOCUM" id="hXTI_IMPDOCUM" value="{$XTI_IMPDOCUM}"/>	
		 	<input type="hidden" name="hFEC_ENTREGA" id="hFEC_ENTREGA" value="{$FEC_ENTREGA}"/>	
		 	<input type="hidden" name="hCOD_REFCLIEN" id="hCOD_REFCLIEN" value=""/>
		 	<input type="hidden" name="hERROR_FECHA" id="hERROR_FECHA" value="{$error_fecha}"/>	
		 	<input type="hidden" name="hERROR_CUENTA" id="hERROR_CUENTA" value="{$error_cuenta}"/>	
		 	<input type="hidden" name="hERROR_REFE" id="hERROR_REFE" value="{$error_refe}"/>	
		 	<input type="hidden" name="hERROR_BANCO" id="hERROR_BANCO" value="{$error_banco}"/>	
		 	<input type="hidden" name="hestado_titular" id="hestado_titular" value="{$estado_titular}"/>
		 	<input type="hidden" name="HD_CUENTAABON" id="HD_CUENTAABON" value=""/>
		 	
		 	<input type="hidden" name="ORIGEN" id="ORIGEN" value="{$ORIGEN}"/>	
			<input type="hidden" name="XSN_CONSULTAOK" id="XSN_CONSULTAOK" value="{$XSN_CONSULTAOK}"/>
			<input type="hidden" name="retc" id="status"/>
			<input type="hidden" name="status" id="status"/>
			<input type="hidden" name="vercalcdv" id="vercalcdv"/>
			<input type="hidden" name="vercalcad" id="vercalcad"/>
			<input type="hidden" name="vercalfolio" id="vercalfolio"/>
			
			<input type="hidden" name="grupo"/>
		 	
 			<input type="hidden" name="julfec"/>
			<input type="hidden" name="amdfec"/>
			<input type="hidden" name="dmafec"/>
			<input type="hidden" name="dmafecinc"/>
			<input type="hidden" name="amdfecinc"/>
			<input type="hidden" name="dif"/>
			<input type="hidden" name="amdmovinc"/>
			<input type="hidden" name="dmamovinc"/>
			<input type="hidden" name="color"/>
			<input type="hidden" name="auto"/>
			<input type="hidden" name="autoi"/>
			<input type="hidden" name="valor_minimo_concreto"/>
			<input type="hidden" name="xax"/>		
			<input type="hidden" name="final"/>		
			<input type="hidden" name="finhab"/>		

			<input type="hidden" name="resto"/>	
			
			<input type="hidden" name="COD_LUPA" id="COD_LUPA" value="{$cod_lupa}"/>

			<!-- Modificacion 58156-->
			<input type="hidden" name="Odes_moneda" id="Odes_moneda"/>
			<input type="hidden" name="Oimp_docum_form" id="Oimp_docum_form"/>
			
			<!-- C�BICO - Septiembre 2017. Variables para consultar la cuenta en KGCTT918-->	
 			<input type="hidden" name="COD_BCO_INTERNO" CONTEXTO="COD_BCO_INTERNO" TIPO="A" value="{$cod_bco_interno}"/>
			<input type="hidden" name="COD_OFI_INTERNO" CONTEXTO="COD_OFI_INTERNO" TIPO="A" value="{$cod_ofi_interno}"/>
			<input type="hidden" name="COD_CONTRAP_INTERNO" CONTEXTO="COD_CONTRAP_INTERNO" TIPO="A" value="{$cod_contrap_interno}"/>   
			<input type="hidden" name="COD_FOLIO_INTERNO" CONTEXTO="COD_FOLIO_INTERNO" TIPO="A" value="{$cod_folio_interno}"/> 
			<input type="hidden" name="COD_CTAEXTNO_S" CONTEXTO="COD_CTAEXTNO_S" TIPO="A" value="{$cod_ctaextno_s}"/> 
			<input type="hidden" name="CUBICO" id="CUBICO" value="{$CUBICO}"/>
			
			<input type="hidden" name="hCOD_BCO_SALIDA" id="hCOD_BCO_SALIDA" CONTEXTO="COD_BCO_SALIDA" TIPO="A"/>
			<input type="hidden" name="hCOD_OFI_SALIDA" id="hCOD_OFI_SALIDA" CONTEXTO="COD_OFI_SALIDA" TIPO="A"/>
			<input type="hidden" name="hCOD_DC_SALIDA" id="hCOD_DC_SALIDA" CONTEXTO="COD_DC_SALIDA" TIPO="A"/>   
			<input type="hidden" name="hCOD_CTA_SALIDA" id="hCOD_CTA_SALIDA" CONTEXTO="COD_CTA_SALIDA" TIPO="A"/> 
					
			
		<div class="DivPagina">
			
			<div class="DivTituloVentana">
				<label class="tituloVentanaIzq">
					Acuse de recibo remesas de compensaci�n
			</label>
			</div>  

			<div class="DivContenedorVentana">
			
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="TablaContenidoVentana">
					<tr>
						<td>
								<div class="DivTituloCaja">
									<label class="tituloCajaIzq"/>
									<label class="tituloCajaDer"/>
								</div>
								<div class="DivContenedorCaja">
									<table border="0" cellspacing="0" cellpadding="0" class="TablaContenidoCaja" width="100%">
										<tr>
											<td style="padding-bottom: 0px">
												<label class="EtiquetaAutoescalable">											  
													Tipo ingreso<br/> 
														<select class="CampoObligatorio" id="LST_TIPOINGRESO" name="LST_TIPOINGRESO" value="{$XTI_TIPINGR}" tabindex="0" onchange="comboTipoIngreso();" onblur="comboTipoIngresoVacio();buscarSiguienteHabilitado('LST_TIPOINGRESO');avisoCarburante();" ondeactivate="" onkeypress="return handleEnter(this, event);" onkeydown="return tabularAdelanteOAtras(this)">
															<option value="0"/>
															<option value="1">Cheques</option>
															<option value="2">Ingreso Nomina</option>
															<option value="3">Cheques Carburante</option>
															<option value="4">Cheques Viajes</option>
															<option value="5">Cheques Carburante CAMPSARED</option>
															<option value="6">Gas�leo Bonificado</option>
															<option value="8">Ingreso Campa�a Libret�n</option>
												</select>
												</label>
												<label class="EtiquetaAutoescalable">
													Tipo abono<br/>
													<select class="CampoSalida" id="LST_TIPOABONO" name="LST_TIPOABONO" value="{$XTI_TIPABONO}" tabindex="1" disabled="true" onchange="comboTipoAbono();" onblur="comboTipoAbonoVacio();" ondeactivate="" onkeypress="return handleEnter(this, event);" onkeydown="return tabularAdelanteOAtras(this)">
															<option value="0"/>
															<option value="1">Unitario</option>
															<option value="2">Total Remesa</option>
												</select>
												</label>
												<label class="EtiquetaAutoescalable">
													Moneda<br/>
													<select class="CampoSalida" id="LST_MONEDA" name="LST_MONEDA" value="{$COD_DIISOALF}" tabindex="2" disabled="true" onchange="cambiarCombo();comboMoneda();" ondeactivate="" onkeypress="return handleEnter(this, event);" onkeydown="return tabularAdelanteOAtras(this)">
															<option value="0"/>
															<option value="1">Pesetas</option>
															<option value="2">Euros</option>
												</select>
												</label>
												<label class="EtiquetaAutoescalable">
													Importe remesa<br/>
													<input type="text" size="14" maxlength="12" class="CampoObligatorioImporte" id="IMP_REMES" name="IMP_REMES" value="{$IMP_REMES}" tabindex="3" onblur="mascaraImporte(this,document.all.LST_MONEDA);" onfocus="desformatearImporte(this);" ondeactivate="" onkeypress="return keypressImpReme(this, event);" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
											</td>
										</tr>
									</table>	
								</div>
						</td>
					</tr>
						
					<tr>
						<td>
									
								<div class="DivTituloCaja">
									<label class="tituloCajaIzq">Datos de cuenta de abono </label>
									<label class="tituloCajaDer"/>
								</div>
								<div class="DivContenedorCaja">
									<table border="0" cellspacing="0" cellpadding="0" class="TablaContenidoCaja" width="100%">
										<tr>
										<td>
											<label class="EtiquetaAutoescalable">											  
													Banco<br/> 
													<input type="text" size="4" maxlength="4" class="CampoObligatorioImporte" id="COD_BCOABON" name="COD_BCOABON" value="{$COD_BCOABON}" tabindex="4" onchange="cambioF();" onblur="habilitarBco(this);validarCuenta(this, document.forms[0].COD_OFIABON, document.forms[0].COD_DCABON, document.forms[0].COD_CTAABON);" onkeypress="return handleEnter(this, event, 'nume');habilitarCampo(this, this.value, 'CampoEntradaImporte');" onkeydown="detectarTabAtras(this, event);return tabularAdelanteOAtras(this);" onfocus="this.select();"/>
												</label>
												<label class="EtiquetaAutoescalable">
													Oficina<br/>
													<input type="text" size="4" maxlength="4" class="CampoObligatorioImporte" id="COD_OFIABON" name="COD_OFIABON" value="{$COD_OFIABON}" tabindex="5" onchange="cambioF();" onblur="validarOfiInterno(this);validarCuenta(document.forms[0].COD_BCOABON,this, document.forms[0].COD_DCABON, document.forms[0].COD_CTAABON);" ondeactivate="asumirOficinaVacia(this);" onkeypress="return handleEnter(this, event, 'nume');habilitarCampo(this, this.value, 'CampoEntradaImporte');" onkeydown="detectarTabAtras(this, event);return tabularAdelanteOAtras(this);" onfocus="this.select();"/>
												</label>
												<label class="EtiquetaAutoescalable">											  
													DC<br/> 
													<input type="text" size="2" maxlength="2" class="CampoSalida" id="COD_DCABON" name="COD_DCABON" value="{$COD_DCABON}" tabindex="6" readOnly="true" onchange="" ondeactivate="" onkeypress="return handleEnter(this, event, 'nume');" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
												<label class="EtiquetaAutoescalable">
													Cuenta abono<br/>
													<input type="text" size="12" maxlength="10" class="CampoObligatorioImporte" id="COD_CTAABON" name="COD_CTAABON" value="{$COD_CTAABON}" tabindex="7" onchange="cambioF();reiniciarBenPris();" onblur="validarCuenta(document.forms[0].COD_BCOABON, document.forms[0].COD_OFIABON, document.forms[0].COD_DCABON, this,'cuenta');fobtenerCtaCubico(this);" onkeypress="return handleEnter(this, event, 'nume');habilitarCampo(this, this.value, 'CampoEntradaImporte');" onfocus="formateoBarras(this);" onkeydown="detectarTabAtras(this, event);return tabularAdelanteOAtras(this)"/>
													<img name="1X1" src="/ataa_es_web_pub/images/1x1.gif" width="4" height="3" align="middle"/>
													<input type="image" class="BotonPrismatico" src="/ataa_es_web_pub/images/BotonPrismaticoSoff.gif" name="btConsultaCuentas" id="btConsultaCuentas" width="19px" alt="Consulta Cuentas Cliente" onclick="return consultaCuentas();" onkeypress="" tabindex="8" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
												<label class="EtiquetaAutoescalable" for="" name="lbEntregaNomina" id="lbEntregaNomina">
													Entregado por / Obs.<br/>
													<input type="text" size="29" maxlength="29" class="CampoEntrada" id="DES_OBSERV" name="DES_OBSERV" value="{$DES_OBSERV}" tabindex="9" onblur="comprobarObservacionBlur();" onfocus="focoEntregado();" onkeyup="comprobarObservacion();" onkeypress="return handleEnter(this, event);" onkeydown="return tabularAdelanteOAtras(this)"/>
													<img name="1X1" src="/ataa_es_web_pub/images/1x1.gif" width="4" height="3" align="middle"/>
													<input type="image" class="BotonPrismatico" src="/ataa_es_web_pub/images/BotonPrismaticoSoff.gif" name="btConsultaClientela" id="btConsultaClientela" width="19px" disabled="true" alt="Consulta Titulares" onclick="return consultaTitular();" onkeypress="" tabindex="10" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
												<label class="EtiquetaAutoescalable">
													Impresi�n documento<br/>
													<select class="CampoEntrada" id="IMPRDOC" name="IMPRDOC" value="{$XTI_IMPDOCUM}" tabindex="11" onchange="validarImprDoc()" ondeactivate="validarImprDoc()" onkeypress="return handleEnter(this, event);" onkeydown="return tabularAdelanteOAtras(this)">
															<option value="0"/>
															<option value="1">SI</option>
															<option value="2">NO</option>
													</select> 
												</label>
												<label class="EtiquetaAutoescalable">
													Fecha entrega<br/>
													<input type="text" size="10" maxlength="8" class="CampoEntrada" id="FEC_ENTREGA" name="FEC_ENTREGA" value="{$FEC_ENTREGA}" tabindex="12" onchange="cambioF();" onblur="validarFechaEnt(this);" onkeypress="return handleEnter(this, event, 'fecha');" onfocus="formateoBarras(this);" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
												<label class="EtiquetaAutoescalable">
													Referencia cliente<br/>
													<input type="text" size="13" maxlength="12" class="CampoEntradaImporte" id="COD_REFCLIEN" name="COD_REFCLIEN" value="{$COD_REFCLIEN}" tabindex="13" onchange="cambioF();" onblur="validarReferenciaCliente(this);" onkeypress="return handleEnter(this, event, 'nume');" onfocus="formateoBarras(this);" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
												<label class="EtiquetaAutoescalable">
													Tarifa<br/>
													<input type="text" size="3" class="CampoSalida" id="COD_TARIFA" name="COD_TARIFA" value="{$COD_TARIFA}" tabindex="14" onchange="" readOnly="true" ondeactivate="" onkeypress="return handleEnter(this, event);" onkeydown="return tabularAdelanteOAtras(this)"/>
												</label>
											</td>
										</tr>
									</table>	
								</div>
						</td>
					</tr>
				</table>
			  	<div class="DivBotonera">
					<table border="0" width="100%" cellspacing="0" cellpadding="0">
						<tr>
						<td class="alinearDer">
							<hr class="separadorBotonera"/>
							<input type="button" name="btAceptar" id="btAceptar" value="Aceptar" class="Boton BotonMargenDer" tabindex="15" onkeypress="" onclick="aceptar();" onkeydown="return tabularAdelanteOAtras(this)"/>
							<input type="button" name="btCancelar" id="btCancelar" value="Cancelar" class="Boton BotonMargenDer" tabindex="16" onkeypress="" onclick="cancelar();" onkeydown="return tabularAdelanteOAtras(this)"/>
						</td>
						</tr>
					</table>
	    		</div>
			</div>
			 </div>
	</form>


</body>
</html>
</xsl:template>
</xsl:stylesheet>
