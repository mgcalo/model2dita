xquery version "3.0";

declare namespace file = "http://expath.org/ns/file";
declare namespace model2dita = "http://thinkdita.org/ns/model2dita";

declare variable $input-document := root(.)/element();
declare variable $project-title := $input-document/model2dita:projectname/text();

declare variable $map-template :=
	<map xml:lang="en-US">
		<title />
	</map
;
declare variable $mapref-template := <mapref href="" />;

declare variable $output-folder-path := $input-document//model2dita:output-folder/text();
declare variable $master-ditamap-path := concat($output-folder-path, '/test22.xml');

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
		
		return $main-maprefs
	else ()
};

let $write-file := (file:write($master-ditamap-path, <a />))

return
	(
		replace value of node <title>{$project-title}</title> as first into doc(((file:write($master-ditamap-path, $map-template)), $master-ditamap-path))/*
		,
		insert nodes local:case1() as last into doc($master-ditamap-path)/*
		,
		insert node () as first into .
	)
	
(:
<mapref href="source/{$submap-name}/s_{$submap-name}.ditamap" />

		(
			file:write(concat($output-folder-path, '/test17.xml'), local:generate-topicref-tree($input-document))
		)
		,

		,
		
ro.sync.ecss.extensions.commons.operations.ExecuteMultipleActionsOperation
:)