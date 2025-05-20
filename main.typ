#import "@preview/ori:0.2.2": numbly

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#set text(font: "Maple Mono NF",size:15pt)
#show heading: it => {
  set text(font: "SimHei")
  it
}

#show math.equation: set text(font: (
  (
    name: "Fira Math",
    covers: "latin-in-cjk",
  ),
  "Maple Mono NF"
))

#columns(2)[
= 绪论

== 连续介质

*流体质点*：微观上充分大，宏观上充分小，既能反映出流体宏观物理性质，又不具有变形和旋转等线性尺度效应的分子团。\
*流体微团*：具有线性尺度效应的微小流体团。

== 压缩性
$ beta_p=-1/V frac(dif V, dif p) $
$beta_p$ ：体积压缩系数，$upright("Pa")^(-1)$

$V$ ：原有的体积，$upright("m")^3$

$dif V$ ：原有的体积，$upright("m")^3$

$dif p$ ：压力的变化量，$upright("Pa")$

== 体积弹性系数

$ E=1/beta_p=-frac(dif p,dif V\/V)) $
]




