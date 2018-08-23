<?php

use Pimcore\Kernel;

class AppKernel extends Kernel
{
    /**
     * {@inheritdoc}
     */
    public function boot()
    {
        parent::boot();

        \Pimcore::setKernel($this);
    }

    /**
     * {@inheritdoc}
     */
    public function registerContainerConfiguration(\Symfony\Component\Config\Loader\LoaderInterface $loader)
    {
        parent::registerContainerConfiguration($loader);
    }
}
