About trajopt-feedstock
=======================

Feedstock license: [BSD-3-Clause](https://github.com/tesseract-robotics/trajopt-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/tesseract-robotics/trajopt

Package license: BSD-2-Clause

Summary: Trajectory Optimization Motion Planner

Current build status
====================


<table><tr>
    <td>GitHub Actions</td>
    <td>
      <a href="https://github.com/tesseract-robotics/trajopt-feedstock/actions/workflows/conda-build.yml">
        <img src="https://github.com/tesseract-robotics/trajopt-feedstock/actions/workflows/conda-build.yml/badge.svg?event=push&branch=main">
      </a>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-trajopt-green.svg)](https://anaconda.org/tesseract-robotics/trajopt) | [![Conda Downloads](https://img.shields.io/conda/dn/tesseract-robotics/trajopt.svg)](https://anaconda.org/tesseract-robotics/trajopt) | [![Conda Version](https://img.shields.io/conda/vn/tesseract-robotics/trajopt.svg)](https://anaconda.org/tesseract-robotics/trajopt) | [![Conda Platforms](https://img.shields.io/conda/pn/tesseract-robotics/trajopt.svg)](https://anaconda.org/tesseract-robotics/trajopt) |

Installing trajopt
==================

Installing `trajopt` from the `tesseract-robotics/label/dev` channel can be achieved by adding `tesseract-robotics/label/dev` to your channels with:

```
conda config --add channels tesseract-robotics/label/dev
conda config --set channel_priority strict
```

How to use
----------

<details>
<summary>With conda</summary>

```
conda install trajopt
```

</details>

<details>
<summary>With mamba</summary>

```
mamba install trajopt
```

</details>

<details>
<summary>With pixi</summary>

```
# for adding to your local project
pixi add trajopt
# for installing globally
pixi global install trajopt
```

</details>

Search package versions
-----------------------

It is possible to list all of the versions of `trajopt` available on your platform:

<details>
<summary>With conda</summary>

```
conda search trajopt --channel tesseract-robotics/label/dev
```

</details>

<details>
<summary>With mamba</summary>

```
mamba search trajopt --channel tesseract-robotics/label/dev
```

</details>

<details>
<summary>With pixi</summary>

```
pixi search trajopt --channel tesseract-robotics/label/dev
```

</details>

<details>
<summary>With mamba repoquery, which may provide more information</summary>

```
# Search all versions available on your platform:
mamba repoquery search trajopt --channel tesseract-robotics/label/dev

# List packages depending on `trajopt`:
mamba repoquery whoneeds trajopt --channel tesseract-robotics/label/dev

# List dependencies of `trajopt`:
mamba repoquery depends trajopt --channel tesseract-robotics/label/dev
```

</details>




Updating trajopt-feedstock
==========================

If you would like to improve the trajopt recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`tesseract-robotics` channel, whereupon the built conda packages will be available for
everybody to install and use from the `tesseract-robotics` channel.
Note that all branches in the tesseract-robotics/trajopt-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks, and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@Levi-Armstrong](https://github.com/Levi-Armstrong/)
* [@johnwason](https://github.com/johnwason/)
* [@traversaro](https://github.com/traversaro/)

