# Cell-Tracker

This is the official implementation of our paper titled [Comparative study of maturation profiles of neural cells in different species with the help of Computer Vision and Deep Learning](https://link.springer.com/chapter/10.1007%2F978-981-16-0425-6_26).

Abstract: Comparative analysis of neural composition in interconnected species may focus on their neuronal differences during metamorphosis and, can be used to analyze the variation in “neural underpinnings of cognition” and the vulnerability of neural indisposition. In this paper, we compared Neuroblast Progenitor Cells (NPC) of humans and chimpanzees (and bonobos) to observe if the loss of Amyloid Precursor Protein during evolution can affect NPC migration because of distinctive migration plots of NPC between human and Non-Human-Primates can suggest how chronic phenotypic changes of human-neurons can be different from those of non-human primates’. By assessing the inter-species comparative study of the mean speed of each cell and the half-time of gap-closure in Wound Healing Assay, differential dendritic maturation timings between species can be obtained. Faster NPC-migration may suggest different cell-autonomic features. Hence, we have analyzed the in-vitro pluripotent stem cell technology to find the maturity and development of NPC. We have utilized deep learning algorithms for the segmentation of the cell body from the background and tracking of cell migration from microscopic video obtained from the experimental setup. Our results show different migration patterns between species suggesting different maturation profiles as well as different maturation rates of neuroblast cells in different species. The work laid the groundwork for further analysis in this domain.

## Implementation

Please see our paper for implementation details. You would require the "ImageJ" application after which you can use the MATLAB codes provided (Run `Tracker.m`) in this repository for the final cell segmentation and tracking workflow. ImageJ or Fiji is required for frame separation of the video sequence data.

## Results

The code can be run as a standalone to observe the migration of the cell centroids. A time-series plot of a single cell movement will look something like this:
<img src="/imgs/Cell_Migration.png" style="margin: 10px;">


## Citation
If this repository helps you in any way, consider citing our paper as follows:
```
@inproceedings{basak2020comparative,
  title={Comparative Study of Maturation Profiles of Neural Cells in Different Species with the Help of Computer Vision and Deep Learning},
  author={Basak, Hritam and Kundu, Rohit},
  booktitle={International Symposium on Signal Processing and Intelligent Recognition Systems},
  pages={352--366},
  year={2020},
  organization={Springer}
}
```
