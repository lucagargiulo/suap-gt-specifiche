<!--    
    @data_creazione: 27 Luglio 2022    
    @version: 1.0.0 
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <sch:ns uri="http://agid.it/suap/entities/requisiti_professionali" prefix="ereqpro"/>
    
    <sch:pattern id="requisiti_professionali_ab" abstract="true">
        
        <sch:rule context="$requisiti_professionali">
            <sch:assert test="count(child::*) &gt; 0"> 
                Almeno un titolo professionale deve essere indicato oppure deve essere indicato il preposto con titolo professionale           
            </sch:assert>
        </sch:rule>
        
    </sch:pattern>       

    <sch:pattern id="requisiti_professionali" abstract="false" is-a="requisiti_professionali_ab">
        <sch:param name="requisiti_professionali" value="ereqpro:requisiti_professionali"/>        
    </sch:pattern>
</sch:schema>