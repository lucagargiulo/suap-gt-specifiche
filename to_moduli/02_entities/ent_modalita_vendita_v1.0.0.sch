<!--    
    @data_creazione: 27 Luglio 2022    
    @version: 1.0.0 
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <sch:ns uri="http://agid.it/suap/entities/modalita_vendita" prefix="emodven"/>
    
    <sch:pattern id="modalita_vendita_ab" abstract="true">
        
        <sch:rule context="$modalita_vendita">
            <sch:assert id="modalita_vendita_ab-obbligatorieta" test="count(child::*) &gt; 0"> 
                Almeno uno tra "Vendita al dettaglio" o "Vendita congiunta al dettaglio e all’ingrosso" deve essere selezionato
            </sch:assert>
        </sch:rule>
        
    </sch:pattern>       

    <sch:pattern id="modalita_vendita" abstract="false" is-a="modalita_vendita_ab">
        <sch:param name="modalita_vendita" value="emodven:modalita_vendita"/>        
    </sch:pattern>
</sch:schema>