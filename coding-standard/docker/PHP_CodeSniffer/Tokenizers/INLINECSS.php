<?php

namespace PHP_CodeSniffer\Tokenizers;

class INLINECSS extends Tokenizer
{
    private const ATTRIBUTE_STYLE = 'style=';

    private const STYLE_REGEX = "/style=\"[^\"]+\"/i";

    /**
     * @var array
     */
    private $storedTokens;

    /**
     * @inheritDoc
     */
    protected function tokenize($string)
    {
        $this->logVerbose('*** START INLINE CSS TOKENIZING ***');

        $tokens = [];

        $string = str_replace($this->eolChar, "\n", $string);
        $lines = explode("\n", $string);
        foreach ($lines as $line => $content) {
            do {
                $isMatched = preg_match(
                    self::STYLE_REGEX,
                    $content,
                    $matches
                );
                if (!$isMatched) {
                    $content = '';
                } else {
                    $style = current($matches);

                    $column = stripos($content, self::ATTRIBUTE_STYLE);

                    $tokens[] = [
                        "code" => T_STRING,
                        "type" => 'T_STRING_INLINE_CSS',
                        "content" => $style,
                        'line' => $line + 1,
                        "column" => $column,
                    ];

                    $content = substr($content, $column + strlen($style));
                }
            } while (strlen($content));
        }

        $this->storedTokens = $tokens;

        $this->logVerbose('*** END INLINE CSS TOKENIZING ***');

        return $tokens;
    }

    /**
     * @inheritDoc
     */
    public function processAdditional()
    {
        $this->logVerbose('*** START ADDITIONAL INLINE CSS PROCESSING ***');

        foreach ($this->tokens as $stackPtr => $token) {
            $this->tokens[$stackPtr]['line'] = $this->storedTokens[$stackPtr]['line'];
        }

        $this->logVerbose('*** END ADDITIONAL INLINE CSS PROCESSING ***');
    }

    /**
     * Logs <var>$message</var> if {@link PHP_CODESNIFFER_VERBOSITY} is greater than <var>$level</var>.
     *
     * @param string $message
     * @param int $level
     */
    private function logVerbose($message, $level = 1)
    {
        if (PHP_CODESNIFFER_VERBOSITY > $level) {
            printf("\t%s" . PHP_EOL, $message);
        }
    }
}
