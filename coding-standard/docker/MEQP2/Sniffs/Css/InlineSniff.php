<?php
/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
namespace MEQP2\Sniffs\Css;

use PHP_CodeSniffer\Files\File;
use PHP_CodeSniffer\Sniffs\Sniff;

/**
 * Class InlineSniff
 * Detects inline CSS usage.
 */
class InlineSniff implements Sniff
{
    /**
     * Defines the tokenizers that this sniff is using.
     *
     * @var array
     */
    public $supportedTokenizers = ['INLINECSS'];

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
    private $warningMessage = 'The inline styles are bad practice and increase the size of html page.';

    /**
     * Warning violation code.
     *
     * @var string
     */
    private $warningCode = 'InlineCssFound';

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
