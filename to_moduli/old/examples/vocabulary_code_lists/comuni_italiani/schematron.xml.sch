<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

<!--

  <sch:ns uri="agid:ssu:Examples.DomainTwo" prefix="dt2"/>
  <sch:ns uri="agid:ssu:Examples.DomainThree" prefix="dt3"/>
-->
    <sch:pattern>
        <sch:let name="keysComuni" value="document('ComuniItaliani_cl.xml')//Row/Value[@ColumnRef='code']"/>
        <sch:let name="keysStati" value="document('StatiEsteri_cl.xml')//Row/Value[@ColumnRef='code']"/>
        <sch:rule context="//*[@codiceIstatComune]">
            <sch:let name="text" value="@codiceIstatComune"/>
            <sch:let name="matchedKeys" value="$keysComuni//SimpleValue/text()[normalize-space(.)=$text]"/>
            <sch:report id="now001" test="count($matchedKeys) = 0" role="error">
                Codice non trovato nella code list dei comuni: "<sch:value-of select="$text"/>"
            </sch:report>
        </sch:rule>
        <sch:rule context="//*[@codiceIstatStato]">
            <sch:let name="text" value="@codiceIstatStato"/>
            <!--
            <sch:let name="matchedKeys" value="$keys[contains($text, normalize-space(.))]"/>
            -->
            <sch:let name="matchedKeys" value="$keysStati//SimpleValue/text()[normalize-space(.)=$text]"/>
            <sch:report id="now002" test="count($matchedKeys) = 0" role="error">
                Codice non trovato nella code list degli stati: "<sch:value-of select="$text"/>"
            </sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>