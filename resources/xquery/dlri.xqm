xquery version "3.0";

module namespace dlri = "http://dlri.ro/ns/dlri/";

declare variable $dlri:gramGrp-template as element() :=
   <gramGrp xmlns="http://www.tei-c.org/ns/1.0">
       <pos value="" />
   </gramGrp>
;

declare variable $dlri:lexical-variant-section-template as element() :=
	<form xmlns="http://www.tei-c.org/ns/1.0" type="lexical-variant-section">
        <form type="lexical-variant" />
        {$dlri:gramGrp-template}
    </form>
;

declare variable $dlri:def-template as element() :=
    <def xmlns="http://www.tei-c.org/ns/1.0" n="" />
;

declare variable $dlri:bibl-template as element() :=
    <bibl xmlns="http://www.tei-c.org/ns/1.0" type="unknown">
        <ptr target="unknown" />
        <date />
        <citedRange />
    </bibl>
;

declare variable $dlri:cit-template as element() :=
    <cit xmlns="http://www.tei-c.org/ns/1.0">
        <quote />
        {$dlri:bibl-template}
    </cit>
;

declare variable $dlri:term-template as element() :=
    <term xmlns="http://www.tei-c.org/ns/1.0" xml:lang="" type="unknown" subtype="unknown" />
;

declare variable $dlri:sense-template as element() :=
    <sense xmlns="http://www.tei-c.org/ns/1.0" xml:id="id">
        <idno n="" type="level-label" />
        <idno n="tip-unitate-semantică-subsumată" type="unknown" />
        <idno n="tip-proces-semantic" type="unknown" />
        {$dlri:def-template}
        {$dlri:cit-template}
    </sense>
;
