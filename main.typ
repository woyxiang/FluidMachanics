#import "@preview/numbly:0.1.0": numbly
#import "@preview/cetz:0.3.4"

#let Pa=($upright("Pa")$)
#let vi=($bold(i)$)
#let vj=($bold(j)$)
#let vk=($bold(k)$)

#set heading(numbering: numbly("{1:一}、", default: "1.1  "))

#set text(font: "Maple Mono NF",size:11pt)
#show heading: it => {
  set text(font: "LXGW Neo XiHei")
  it
}

#show math.equation: set text(font: (
  (
    name: "Fira Math",
    covers: "latin-in-cjk",
  ),
  "Maple Mono NF"
))

#set page(columns: 2)

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

$ E=1/beta_p=-frac(dif p,dif V\/V) $

== 膨胀性

$ beta_t=1/V frac(dif V,dif T) $

$beta_t$：体积膨胀系数，$upright("K")^(-1)$

$V$：原有的体积，$upright("m")^3$

$dif V$：体积的变化量，$upright("m")^3$

$dif T$：温度的变化量，$upright("K")$

== 黏性
*牛顿内摩擦定律*

#cetz.canvas({
  import cetz.draw: *
  //下板
  rect((0,0),(4,-0.1))
  content((4.3,-0.05),text(0.55em)[A板])
  //上板
  rect((0,2),(4,2.1))
  content((4.19,2.25),text(0.55em)[B板])
  line((0.5,0),(0.5,2))//流体开头
  line((0.5,0),(3.5,2))//速度梯度
  set-style(mark: (end: "straight"))//左箭头
  
  // 速度u_0
  line((1.4,2.2),(2.4,2.2))
  content((1.8,2.4),text(0.75em)[$u_0$])

  //速度分布
  let n=1
  while n < 6 {
    
    let LCord = 2 * n/6
    line((0.5,LCord),(3*n/6+0.5,LCord))
    n+=1
  }
  
  //拉力T
  line((4.1,2.1),(5,2.1))
  content((4.9,1.9),text(0.75em)[$T$])

  set-style(mark: (symbol: "straight"))//双向箭头

  line((0.25,0),(0.25,2))
  content((0.12,1),text(0.75em,[$y$]))
  
})

$ Tau=mu u_0/y A $

$Tau$：平板受到的压倒性阻力，$upright("N")$\
$mu$：由*流体性质*决定的物质常数，称为动力黏度，单位是$upright("Pa·s")$或$upright("N·s/")upright("m")^3$\
$u_O$：平板运动的速度，m/s\
$y$：平板的间距，m\
$A$：平板丰流体的面积，$upright("m")^3$

== 黏性切应力

$ tau=T/A=mu u_0/y=mu frac(dif u ,dif y) $

$(dif u)/(dif y)$：单位距离上的速度差，即*速度梯度*（也称为*角形变率*），$upright("s")^(-1)$

常见非牛顿流体有：原油、钻井液及高分子聚合物水溶液等

== 运动黏度

$ v=mu/rho $
是动力黏度与季度的比值，单位为$upright("m")^2upright("/s")$

== 界面张力

$ sigma ，"单位是"upright("N/m") $

== 质量力

属于非力，常见有重力、引力、惯性力、电场力和电磁力

单位质量流体受到的质量力用$bold(f)$表示
$ bold(f)=lim_(Delta arrow 0)(Delta bold(f))/(Delta m) $
在直角坐标系中表示为
$ bold(f)=F_x/m bold(i)+F_y/m bold(j)+F_z/m bold(k)=X bold(i)+Y bold(j)+Z bold(k) $
$F_x,F_y,F_z$：质量力在$x,y,z$坐标方向上的分量\
$X,Y,Z$：$bold(f)$在三个坐标方向上的分量\
$bold(i),bold(j),bold(k)$：单位矢量

由其可推出：
$ cases(
  F_x=X dot m,
  F_y=Y dot m,
  F_z=Z dot m
) $

== 表面力

如大气压力，摩擦力

单位面积上的表面力可表示为
$ bold(p)_n=lim_(Delta arrow 0)frac(Delta bold(P),Delta A) $

微元面积$Delta A$上的力为$Delta P$

$bold(P)_n$分解出法向分量p为压强，流体力学中称为压力，\
切向分量$tau$为压倒性剪切力

= 流体静力学

静止流体中的表面力只有法向力，即物理学中的压强，流体力学中称为流体静压力

$ 1 upright("bar")&=1 times 10^5 Pa \
 1 upright("atm")&=1.01325 times 10^5 Pa\
1 upright("atm")&=760upright("mmHg")\
1 upright("atm")&=10.34upright(m H_2O)\ 
 1upright("mmHg")&=133.28 Pa \
 1upright(m H_2O)&=9800 Pa $

== 流体平衡微分方程

$ cases(
  X-1/rho frac(partial p,partial x)=0,
  Y-1/rho frac(partial p,partial y)=0,
  Z-1/rho frac(partial p, partial z)=0
) 
$

$ bold(f)&=X vi+Y vj+Z vk\
&=1/rho (frac(partial p,partial x)vi+frac(partial p,partial y)vj+frac(partial p,partial z)vk) $
由汉密尔顿算符$nabla=frac(partial,partial x)vi+frac(partial,partial y)vj+frac(partial,partial z)vk$可得一个矢量式
$ bold(f)-1/rho nabla p=0 $
$nabla p$称为压力梯度

该方程又称欧拉平衡方程

当流体处于平衡状态时，作用在单位质量流体上的质量力与压力的合力相平衡

限定条件：同种相连通的绝对静止流体的水平面为等压面

*压力全微分形式*：$ dif p=rho(X dif x+Y dif y+Z dif z) $

== 静力学基本方程

$ z_1+p_1/(rho g)=z_2+p_2/(rho g)=c $
适用条件：重力作用下静止的均质流体

几何意义：$z$称为位置水头，$p/(rho g)$称为压力水头，$z+p/(rho g)$称为管水头。\
*静止流体中测压管水头为常数*

*物理意义*\
单位重力流体所具有的位置势能为：
$ frac(m g z ,m g )=z $
因此，$z$也被称为比位能

$p/(rho g)$代表单位重力流体所具有的压力势能，简称比压能

*静止流体中总比能为常数*

== U形测压管

$ p_A=rho' g H-rho g H $
对气体，密度可忽略不记
$ p_A=rho' g H $

== U形压差计

$ Delta p=p_A-p_B=(rho-rho')g H $
等加速水平容器中静力公式：
$ p=p_0-rho(a x+g z) $
匀加速水平直线运动的容器中等压面方程：
$ a x+g z=c $

自由表面方程：

$ a x+g z_s=0 $或
$ z_s=-a/g x $

等角速度旋转容器中流体相对平衡\
单位质量流体所受到到的质量力$bold(f)$的三个分量：
$ cases(
  X=omega^2 r cos alpha=omega^2 x,
  Y=omega^2 r sin alpha=omega^2 y,
  Z=-g
) $
等解速度旋转容器中的静压力分布公式
$ p=p_0+rho g((omega^2r^2)/(2g)-z) $

== 液体对平面总压力
$ P=rho g h_c A $

$ y_D=y_C+J_C/(y_C A) $
压力中心$D$永远低于平面形心

*常见惯性矩*

矩形：$J_C=(B H^3)/12$\
$H$：可见闸门边长\
$B$：不可见闸门边长

圆形：$J_C=pi/64 D^4$\

== 静止流体作用在曲面上的总压力

$ P_x=rho g h_C A_x $
对于半球面：$A_x=(pi d^2)/4$
$ P_y=rho g h_C A_s $
$ P_z=rho g V "(竖直方向)" $

总压力可表示为
$ bold(P)=P_x vi+P_y vj+P_z vk $

= 流体运动学

== 拉格朗日表达式

速度：

$ cases(
  u_x=frac(diff x,diff t),
  u_y=frac(diff y,diff t),
  u_z=frac(diff z,diff t)
  ) $

加速度：

$ cases(
  a_x=frac(diff u_x,diff t)=frac(diff^2 x,diff t^2),
  a_y=frac(diff u_y,diff t)=frac(diff^2 y,diff t^2),
  a_z=frac(diff u_z,diff t)=frac(diff^2 z,diff t^2)
) $

== 欧拉表达式

速度：
$ u_x=u_x (x,y,z,t) $

加速度：
$ bold(a)=frac(dif bold(u),dif t) $

== 迹线

消去拉格朗日法表达式中的$t$就是迹线方程

== 流线
$ frac(dif x,u_x)=frac(dif y,u_y) $

== 连续性方程

$ frac(diff rho,diff t)+frac(diff rho u_x,diff t)+frac(diff rho u_y,diff t)+frac(diff rho u_z,diff t)=0 $
或
$ frac(dif rho,dif t)+rho nabla bold(u)=0 $ 

== 运动分析

+ 速度大小$ u=sqrt(u_x^2+u_y^2) $
+ 流线方程$ frac(dif x,u_x)=frac(dif y,u_y) $
+ 线率形速率$ &epsilon_(x x)=frac(diff u_x,diff x), epsilon_(y y)=frac(diff u_y,diff y)\
              &epsilon_(x x)+epsilon_(y y) cases(=0"可压",eq.not 0"不可压") $
+ 角变形速度$ epsilon_(y x)=1/2(frac(diff u_x,diff y)+frac(diff u_y,diff x)) $
+ 旋转角速度$ &omega_z=1/2(frac(diff u_y,diff x)-frac(diff u_x,diff y))\
              &omega_z cases(=0"无旋流动",eq.not 0"有旋流动") $

= 带泵的伯努利方程

$ z_1+p_1/(rho g)+v_1^2/(2g)+H=z_2+p_2/(rho g)+v_2^2/(2g)+h_(w_(1-2)) $
$z$：位置水头\
$p/(rho g)$：压力水头\
$v/(2g)$：流速水头\
$H$：泵的扬程\
$h_(w_(1-2))$：水头损失

由此：泵的扬程$H$等于泵前后两断面上的总比能差加上两断面的水头损失

== 泵的功率

有效功为：$ W=rho g Q H dif t $
有效功率为：$ N_泵=rho g Q H $
泵效：$ eta_泵=N_泵/N_轴 $

泵的输入功率称为泵的额定功率，也称之为轴功功率，以$N_轴$表示\
电动机效率：$ eta_电=N_轴/N_泵 $

= 相似原理

几何相似$cases(
  "线段成比例",
  "角度成比例",
  "边界性质相同"
)$

运动相似：两个流动对应点处的同名运动学量成比例。

重力相似准则：$ F r=v\/sqrt(g l) $
黏性力相似准则：$ R e=rho v d\/mu =v d \/nu $
压力相似准则：$ E u=p\/rho v^2 $

= 黏性流体动力学
== N-S方程
$ X-1/rho frac(diff p,diff x)+nu(frac(diff^2 u_x,diff x^2)+frac(diff^2 u_x,diff y^2)+frac(diff^2 u_x,diff z^2))=frac(dif u,dif t) $
== 达西公式
$ h_f=lambda L/D v^2/(2g) $

== 圆管层流速度分布

$ u_x=u_x(y,z), u_y=u_z=0,frac(diff A,diff t)=0 $
$ frac(diff p,diff x)=frac(Delta p,l) $
$ frac(diff^2 u_x,diff y^2)=frac(diff^2 u_x,diff z^2)=frac(diff^2 u_x,diff r^2) $

= 复杂管路水力计算

串联管路$cases(
  Sigma Q_i=0,
  h_f=Sigma h_f_i
)$

并联管路$cases(
  Q=Sigma Q_i,
  h_f=h_f_1=h_f_2=dots.c=h_f_i
)$

$ h_f=0.0826 lambda frac(Q^2 l,D^5) $
