##Introduction##
A light weight Kohana Solr module that uses JSON response and JSON input for faster document indexing and simplicity.

##Features##
Transparently add documents to solr from PHP arrays or objects:

    <?php
    $doc = array(
        'id' => 1234,
        'title' => 'How to tie a tie',
    );
    
	Solr::instance()->index($doc);

Index multiple docs at once:

    <?php
    Solr::instance()->batch_index($docs);

Simple search:

    <?php
    $response = Solr::instance()->search($lucene_query);
