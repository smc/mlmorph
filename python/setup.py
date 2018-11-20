from setuptools import setup

setup(
    zip_safe=False,
    entry_points={
        'console_scripts': [
            'mlmorph = mlmorph.__main__:main'
        ],
    }
)