<?php

declare(strict_types=1);

/**
 * Register an autoloader.
 */
spl_autoload_register(function ($class) {
    // Only try & load our own classes.
    if (stripos($class, 'PHP_CodeSniffer\Tokenizers\INLINECSS') !== 0
        && stripos($class, 'PHP_CodeSniffer\Tokenizers\FILETYPE') !== 0
    ) {
        return;
    }

    $file = realpath(__DIR__) . DIRECTORY_SEPARATOR . strtr($class, '\\', DIRECTORY_SEPARATOR) . '.php';

    if (file_exists($file)) {
        include_once $file;
    }
});
