from setuptools import setup

setup(
    zip_safe=False,
    version=open('VERSION').read().strip(),
    entry_points={
        'console_scripts': [
            'mlmorph = mlmorph.__main__:main'
        ],
    }
)
