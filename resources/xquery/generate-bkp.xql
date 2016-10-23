xquery version "3.0";

declare namespace file = "http://expath.org/ns/file";
declare namespace model2dita = "http://thinkdita.org/ns/model2dita";

declare variable $input-document := root(.)/element();
declare variable $mapref-template := <mapref xmlns="http://expath.org/ns/crypto" href="" />;
declare variable $output-folder := $input-document//model2dita:output-folder/text();
declare variable $submaps-criterion := $input-document//model2dita:submaps/text();

declare function local:generate-name($input) {
	lower-case(translate($input, " ", "-"))
};

declare function local:generate-topicref-tree($node) {
	for $topic in $node//model2dita:topic[model2dita:level = 1]
	let $level := $topic/model2dita:level/text()
	let $title := $topic/model2dita:title/text()
	let $type := $topic/model2dita:type/text()
	
	return 	<topicref xmlns="http://expath.org/ns/crypto" href="{substring($type, 1, 1)}_{local:generate-name($title)}.xml" navtitle="{$title}" format="dita" type="{$type}" />
};

declare function local:case1() {
	if ($submaps-criterion = '1')
	then
		let $main-maprefs :=
			for $main-topic in $input-document//model2dita:topic[model2dita:level = 1]
			let $submap-name := local:generate-name($main-topic/model2dita:title/text())
			let $processed-template :=
				copy $template := $mapref-template
				modify replace value of node $template/@href with 'cuvântul.titlu-formație.internă-compus-format.din-element adăugat'
				return $template
				
			return $processed-template
		let $write-file := file:write(concat($output-folder, '/test22.xml'), $main-maprefs)
		
		return (file:write(concat($output-folder, '/test22.xml'), <a />), $main-maprefs)
	else ()
};


	(
		insert nodes local:case1() as last into doc(concat($output-folder, '/test22.xml'))/*
		,
		insert node () as first into .
	)
	
(:
<mapref href="source/{$submap-name}/s_{$submap-name}.ditamap" />

		(
			file:write(concat($output-folder, '/test17.xml'), local:generate-topicref-tree($input-document))
		)
		,

		,
		
ro.sync.ecss.extensions.commons.operations.ExecuteMultipleActionsOperation
:)