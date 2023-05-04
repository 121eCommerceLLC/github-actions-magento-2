<?php
/**
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
namespace Ecommerce121\Sniffs\Classes;

use PHP_CodeSniffer\Sniffs\Sniff;
use PHP_CodeSniffer\Files\File;

/**
 * Class ObjectManagerClassSniff
 * Detects direct ObjectManager class usage.
 */
class ObjectManagerClassSniff implements Sniff
{
    /**
     * Violation severity.
     *
     * @var int
     */
    private $severity = 8;

    /**
     * String representation of warning.
     *
     * @var string
     */
    private $warningMessage = 'The direct use of ObjectManager is discouraged. Inject necessary dependencies via constructor.';

    /**
     * Warning violation code.
     *
     * @var string
     */
    private $warningCode = 'ObjectManagerClassFound';

    /**
     * Restricted classes
     *
     * @var array
     */
    private $classes = [
        'ObjectManager',
    ];

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
        $tokens = $phpcsFile->getTokens();
        $token = $tokens[$stackPtr]['content'];
        if (in_array($token, $this->classes)) {
            $phpcsFile->addError($this->warningMessage, $stackPtr, $this->warningCode, [], $this->severity);
        }
    }
}
