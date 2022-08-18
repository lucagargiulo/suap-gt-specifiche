<!--
    @data_creazione: 27 Luglio 2022    
    @version: 1.0.0   
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <sch:ns uri="http://agid.it/suap/entities/documento_rilasciato" prefix="edocril"/>
    
    <sch:pattern id="documento_rilasciato_ab" abstract="true">
        
        <sch:rule context="$documento_rilasciato">
            <sch:p>
                Verifico che la data di rilascio sia precedente alla data di scadenza                
            </sch:p>
            
            <sch:let name="dataRilascio" value="xs:date(edocril:data_rilascio)"/>
            <sch:let name="dataScadenza" value="xs:date(edocril:data_scadenza)"/>
            
            <sch:assert id="ass_dr_check_date" test="($dataScadenza &gt;= $dataRilascio)">
                
                Data Scadenza (<sch:value-of select="$dataScadenza"/>) deve essere successiva a data di rilascio (<sch:value-of select="$dataRilascio"/>)
            </sch:assert>
            
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="documento_rilasciato" abstract="false" is-a="documento_rilasciato_ab">
        <sch:param name="documento_rilasciato" value="edocril:documento_rilasciato"/>        
    </sch:pattern>
</sch:schema>