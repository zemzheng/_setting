<?PHP
$output = '';

function makeLine( $str, $type ){
    $link = '';
    switch( $type ){
        case 'function':
            $link = str_replace( '_', '-', $str );
            $link = "\t# http://php.net/manual/en/function.$link.php";
            break;
        # case 'class':
        #     $link = str_replace( '_', '-', $str );
        #     $link = "\t# http://php.net/manual/en/class.$link.php";
        #     break;
    }
    return "$str$link\n";
}
$list = get_declared_classes();
$i = 0;
while( $item = isset( $list[ $i ] ) ? $list[ $i++ ] : 0 ){
    $output .= makeLine( $item, 'class' );
}



$list = get_defined_functions();
$list = $list['internal'];
$i = 0;
while( $item = isset( $list[ $i ] ) ? $list[ $i++ ] : 0 ){
    $output .= makeLine( $item, 'function' );
}

$list = get_defined_constants();
foreach( $list as $key => $val ){
    $output .= makeLine( $key, 'constants' );
}

file_put_contents( './php.dict', $output );
