<?php
/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
namespace MEQP2\Sniffs\Files;

use PHP_CodeSniffer\Files\File;
use PHP_CodeSniffer\Sniffs\Sniff;

/**
 * Class UnnecessaryFilesSniff
 * Detects unnecessary files usage.
 */
class UnnecessaryFilesSniff implements Sniff
{
    /**
     * Defines the tokenizers that this sniff is using.
     *
     * @var array
     */
    public $supportedTokenizers = ['FILETYPE'];

    /**
     * Violation severity.
     *
     * @var int
     */
    protected $severity = 8;

    /**
     * String representation of warning.
     *
     * @var string
     */
    private $warningMessage = 'Unnecessary file found.';

    /**
     * Warning violation code.
     *
     * @var string
     */
    private $warningCode = 'FileFound';

    /**
     * @inheritdoc
     */
    public function register()
    {
        return [
            T_STRING,
        ];
    }

    /**
     * @inheritdoc
     */
    public function process(File $phpcsFile, $stackPtr)
    {
        $phpcsFile->addError($this->warningMessage, $stackPtr, $this->warningCode, [], $this->severity);
    }
}
