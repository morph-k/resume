// Typst port of main.tex. The LaTeX document remains the published source of
// record; this is a parallel implementation of the same resume.

#set document(title: "Morphy Kuffour - Resume", author: "Morphy Kuffour")

#set page(
  paper: "a4",
  margin: (left: 0.5in, right: 0.5in, top: 0.5in, bottom: 0.4in),
)

#set text(
  font: ("New Computer Modern", "Libertinus Serif", "Times New Roman"),
  size: 11pt,
  hyphenate: false,
)

#set par(justify: false, leading: 0.5em, spacing: 0.6em)

#show link: set text(fill: rgb("#0000ee"))

// ---------------------------------------------------------------- primitives

// Section rule. Pass a title, or none for the untitled summary band.
#let section(title: none) = {
  v(9pt, weak: true)
  if title != none {
    text(size: 13pt, smallcaps(title))
    v(-3.5pt)
  }
  line(length: 100%, stroke: 0.6pt)
  v(-1pt)
}

// Employer / school block: bold name + right-aligned location, then the
// italic role + italic date range underneath.
#let subheading(title, location, role, dates) = {
  block(above: 7pt, below: 3pt, grid(
    columns: (1fr, auto),
    row-gutter: 2pt,
    title, align(right, location),
    emph(role), align(right, emph(dates)),
  ))
}

// Small italic annotation used for course lists and club memberships.
#let detail(body) = {
  block(above: 3pt, below: 0pt, text(size: 8.5pt, style: "italic", body))
}

#let bullets(..items) = {
  block(above: 4pt, below: 4pt, list(
    marker: [•],
    indent: 6pt,
    body-indent: 6pt,
    spacing: 4pt,
    ..items,
  ))
}

#let subbullets(..items) = {
  block(above: 3pt, below: 3pt, list(
    marker: [◦],
    indent: 12pt,
    body-indent: 6pt,
    spacing: 3pt,
    ..items,
  ))
}

#let note(body) = block(above: 4pt, below: 2pt, text(size: 10pt, body))

// ------------------------------------------------------------------- heading

*Morphy Kuffour*
#h(4pt) | #h(4pt) #link("mailto:mail@morphykuffour.com")[mail\@morphykuffour.com]
#h(4pt) | #h(4pt) #link("https://www.linkedin.com/in/morphy-kuffour/")[LinkedIn]
#h(4pt) | #h(4pt) #link("https://github.com/morph-k")[GitHub]
#h(4pt) | #h(4pt) #link("https://morphykuffour.github.io/")[Personal Blog]

#section()

Linux-focused technology professional with hands-on experience in cybersecurity,
cloud engineering, MLOps, and infrastructure automation.

// ----------------------------------------------------------------- education

#section(title: "Education")

#subheading(
  strong(link("https://www.gatech.edu/")[Georgia Institute of Technology]),
  "Atlanta, GA, USA",
  "M.S., Cybersecurity - Information Security",
  "Jan 2026 - Present",
)

#detail[
  *Relevant Courses:* Applied Cryptography, Secure Computer Systems, Network
  Security, Advanced Topics in Malware Analysis, Hardware-Oriented Security and
  Trust, Compilers
]

#detail[
  *Electives:* #link("https://www.nature.com/articles/nature16961")[AI],
  #link("https://link.springer.com/journal/11569")[Ethics],
  Entrepreneurship
  (#link("https://www.investopedia.com/terms/s/subchapters.asp")[S-Corp]
  \+ #link("https://www.investopedia.com/terms/c/c-corporation.asp")[C-Corp]
  \+ #link("https://www.investopedia.com/terms/s/spac.asp")[Special Purpose Acquisition Companies (SPACs)]
  \+ #link("https://en.wikipedia.org/wiki/Non-governmental_organization")[NGO]) + LLC
]

#subheading(
  strong(link("https://uconn.edu/")[University of Connecticut]),
  "Storrs, CT, USA",
  "B.S.E, Computer Science and Engineering",
  "Aug 2019 - May 2023",
)

#detail[
  *Relevant Courses:* Operating Systems, Data Structures, Analysis Of
  Algorithms, Machine Learning, Networking, Databases
]

#detail[
  *Programs & Clubs:*
  #link("https://honors.uconn.edu/")[UConn Honors Program],
  #link("https://github.com/UConn-UPE")[UConn Upsilon Pi Epsilon],
  #link("https://www.nsf.gov/funding/opportunities/lsamp-louis-stokes-alliances-minority-participation")[Louis Stokes Alliance for Minority Participation (LSAMP)],
  #link("https://nsbe.org/")[National Society for Black Engineers (NSBE)],
  #link("https://uconntact.uconn.edu/organization/uconncyber")[UConn Cybersecurity Club]
]

// -------------------------------------------------------------------- skills

#section(title: "Skills Summary")

#block(above: 6pt, text(size: 10pt, grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 3pt,

  strong("Systems & Infrastructure:"),
  [
    #link("https://github.com/torvalds/linux")[Linux],
    #link("https://nixos.org/manual/nixos/stable/")[NixOS],
    #link("https://guix.gnu.org/")[Guix],
    #link("https://openzfs.org/wiki/Main_Page")[ZFS],
    #link("https://gitlab.com/cryptsetup/cryptsetup")[LUKS],
    #link("https://podman.io/docs")[Podman],
    #link("https://www.qemu.org/")[QEMU],
    #link("https://riscv.org/")[RISC-V],
    #link("https://ebpf.io/")[eBPF],
    #link("https://developer.hashicorp.com/vagrant")[Vagrant],
    #link("https://github.com/lima-vm/lima")[Lima]
  ],

  strong("Programming:"),
  [
    Python(#link("https://docs.astral.sh/uv/")[uv]
    \+ #link("https://python-poetry.org/docs/")[poetry]),
    #link("https://en.wikipedia.org/wiki/Robot_Operating_System")[ROS],
    #link("https://www.lua.org/")[Lua] (#link("https://love2d.org/")[LÖVE]),
    #link("https://nixos.org/")[Nix],
    #link("https://go.dev/")[Go],
    #link("https://gustedt.gitlabpages.inria.fr/modern-c/")[C],
    #link("https://rust-lang.org/")[Rust],
    #link("https://gnucobol.sourceforge.io/doc/gnucobol.pdf")[COBOL],
    #link("http://tuxgraphics.org/~guido/scripts/awk-one-liner.html")[AWK],
    #link("https://www.gnu.org/software/gawk/manual/gawk.html")[GAWK]
  ],

  strong("Cloud & DevOps:"),
  [
    #link("https://docs.aws.amazon.com/")[AWS], Azure, Azure ETL,
    #link("https://about.gitlab.com/topics/ci-cd/cicd-pipeline/")[CI/CD Pipelines]
  ],

  strong("Tools:"),
  [
    #link("https://git-scm.com/docs")[Git],
    #link("https://neovim.io/doc/user/")[Neovim],
    #link("https://www.gnu.org/software/emacs/manual/")[Emacs],
    #link("https://www.sqlite.org/docs.html")[SQLite],
    #link("https://docs.ansible.com/projects/ansible/latest/index.html")[Ansible],
    #link("https://en.wikipedia.org/wiki/SCADA")[SCADA],
    #link("https://www.wireshark.org/download.html")[Wireshark]
  ],

  strong("Certifications:"),
  [Security+, RHCSA, OSCP(In Progress), CCIH(In Progress), CISSP(In Progress)],

  strong("Cybersecurity:"),
  [
    #link("https://morphykuffour.github.io/linux/tshark/hacking/2025/02/20/TShark-Keylogger.html")[USB Protocol Traffic Analysis],
    #link("https://security.berkeley.edu/education-awareness/enabling-full-disk-encryption")[FDE],
    #link("https://github.com/frangelbarrera/OSINT-BIBLE")[OSINT]
  ],

  strong("GenAI:"),
  [
    #link("https://arxiv.org/abs/2005.11401")[RAG],
    #link("https://arxiv.org/html/2409.17383v1")[Vector Search],
    #link("https://kalyna.pro/llm-application-development/")[LLM Application Development]
    (#link("https://github.blog/ai-and-ml/llms/the-architecture-of-todays-llm-applications/")[Architecture]),
    #link("https://www.anthropic.com/engineering/building-effective-agents")[AI Agent Development],
    #link("https://huyenchip.com/mlops/")[MLOps]
  ],

  strong("Cryptography:"),
  [
    #link("https://arxiv.org/pdf/2404.16109v1")[zkLLM],
    #link("https://www.usenix.org/system/files/usenixsecurity25-liang-sok.pdf")[zk-SNARKs],
    #link("https://www.mdpi.com/2410-387X/4/2/15")[Side Channel Analysis],
    #link("https://taoa.io/posts/Understanding-KZG10-Polynomial-Commitments")[KZG10 Polynomial Commitments],
    #link("https://www.getmonero.org/resources/research-lab/")[Ring Signatures],
    #link("https://nvlpubs.nist.gov/nistpubs/ir/2016/NIST.IR.8105.pdf?ref=pqcinformation.com")[Post-Quantum Encryption],
    #link("https://web.eecs.utk.edu/~ktomsovi/Vitae/Publications/VENK05.pdf")[Power Analysis],
    #link("https://www.qsl.net/ab4oj/dl/rs/intro_rf_design.pdf")[Radio Frequency Analysis]
  ],

  strong("Soft Skills:"),
  [
    #link("https://thayerleadership.com/")[Leadership],
    Effective Verbal and Written Communication Skills,
    #link("https://orgmode.org/manual/Clocking-Work-Time.html")[Time Management]
  ],
)))

// ---------------------------------------------------------------- experience

#section(title: "Relevant Experience")

#subheading(strong("RTX"), "Remote", "GRC Cybersecurity Analyst", "May 2025 - Aug 2026")

#note[
  Currently supporting Pratt & Whitney's compliance initiatives focused on
  improving compliance posture. Collaborating with cross-functional teams to
  meet compliance requirements.
]

#bullets(
  [
    Supporting GRC (Governance, Risk & Compliance) initiatives by scripting
    automated compliance validation tools in Bash, PowerShell and Python,
    enabling faster remediation and reducing audit turnaround time.
  ],
  [
    Leading the development of a Retrieval-Augmented Generation (RAG)
    application for the Global GRC team, using local vector search and an Azure
    LLM backend to streamline policy inquiries, automate control mapping, and
    deliver data-driven compliance insights with auditable, row-level citations.
  ],
)

#subheading(
  strong("RTX"), "Remote",
  "Digital Leadership Development Program Associate", "May 2023 - June 2025",
)

#bullets(
  [
    *Cloud Data Engineer (Rotation 3):* Developing enterprise-scale AI solutions
    for manufacturing
    #subbullets(
      [
        Implemented MLOps pipeline: Reduced model deployment time by 40% through
        performance optimization and automated CI/CD workflows
      ],
      [
        Optimized data processing: Built Azure-based ETL pipeline that replaced a
        manual process, reducing processing time by 65%
      ],
    )
  ],
  [
    *Technical Product Manager (Rotation 2):* Led legacy application
    modernization initiative
    #subbullets(
      [
        Accelerated migration timeline: Built a Lotus Notes MVP using the Mendix
        platform
      ],
      [
        Increased collaboration: Improved cross functional communication by
        utilizing Agile methodologies
      ],
    )
  ],
  [
    *Software Developer (Rotation 1):* Developed compliance automation solutions
    #subbullets(
      [
        Streamlined document classification: Built PowerShell solution for
        SharePoint metadata management
      ],
      [
        Enhanced data governance: Integrated Term Store taxonomy reducing manual
        classification errors by 25%
      ],
    )
  ],
)

#subheading(
  strong("RTX"), "Remote",
  "Digital Leadership Development Program Intern", "Aug 2021 - May 2023",
)

#note[
  Supported enterprise-wide identity management initiatives focused on improving
  security posture and user experience. Collaborated with cross-functional teams
  to implement MFA solutions at scale.
]

#bullets(
  [
    Part of the RTX Corporate Identity Access Solutions team that facilitated
    Multi-Factor Authentication (MFA) solutions for over 30,000 employees.
  ],
  [Created documentation on the Single Sign-On (SSO) process.],
)

#subheading(
  strong("UConn Research Assistant"), "Hybrid - Storrs, CT",
  "Undergraduate Research Assistant", "Aug 2021 - May 2023",
)

#bullets(
  [
    Worked with Prof. Clay Tabor on porting
    #link("https://www.cesm.ucar.edu/")[Community Earth System Model (CESM)] to
    the UConn high performance computing system.
  ],
  [
    Wrote honors thesis on
    #link("https://morphykuffour.github.io/thesis/")["Creating Reproducible Environments with Nix for Scientific Computing"]
  ],
)

// -------------------------------------------------------------- achievements

#section(title: "Achievements")

#subheading(
  strong("1st Place UConn Senior Design Project"),
  link("https://uconn.edu/")[University of Connecticut],
  [Project: #link("https://seniordesignday.engr.uconn.edu/seniorprojectpt/senior-design-2023-computer-science-and-engineering-team-05/")[HuskyFit Mobile Application]],
  "May 2023",
)

#bullets(
  [Part of a team that designed a Health and Fitness Mobile Application],
  [
    Utilized React framework, AWS technologies, and other software development
    tools to simplify the development process
  ],
  [
    Presented the project to industry experts, securing 1st Place in the design
    competition.
  ],
  [Competed against 39 Engineering teams to achieve this recognition.],
)

#subheading(
  strong("Finalists in the RTX LDP Impact Project"),
  "RTX",
  "Project: Finance for Non-Finance",
  "June 2025",
)

#bullets(
  [
    Collaborated on the design and development of an AI-generated short-form
    finance video aimed at improving financial literacy among RTX OSQ employees.
  ],
  [
    Competed against 19 cross-functional LDP teams within RTX to achieve this
    recognition.
  ],
)

// ------------------------------------------------------------------ projects

#section(title: "Projects")

#bullets(
  [
    *USB Protocol Traffic Analysis*: Instrumented the Linux USB stack to capture
    and decode raw HID traffic, reconstructing keystrokes from packet captures to
    demonstrate the interception risk of unencrypted peripheral buses. Documented
    both the capture setup and the decoding technique. Tech:
    #link("https://www.wireshark.org/docs/")[Wireshark],
    #link("https://www.wireshark.org/docs/man-pages/tshark.html")[tshark],
    #link("https://www.kernel.org/doc/html/latest/usb/usbmon.html")[usbmon],
    #link("https://www.kernel.org/doc/html/latest/")[Linux] \
    Write-ups: #link("https://morphykuffour.github.io/linux/tshark/hacking/2025/02/20/TShark-Keylogger.html")[Using tshark as a keylogger],
    #link("https://morphykuffour.github.io/linux/wireshark/2025/02/19/Wireshark-USB-Capture-Setup.html")[USB capture on Wireshark]
  ],
  [
    *NixOS on Encrypted ZFS*: Built a fully declarative Linux install on an
    encrypted ZFS root, covering pool layout, native ZFS encryption, and
    unlocking the dataset at boot. Produced a reproducible procedure for an
    at-rest-encrypted workstation. Tech: NixOS, ZFS,
    #link("https://www.kernel.org/doc/html/latest/admin-guide/initrd.html")[Linux boot/initrd] \
    Write-up: #link("https://morphykuffour.github.io/linux/nixos/2024/11/08/NixOs-ZFS.html")[Installing NixOS on a ZFS Encrypted Partition]
  ],
  [
    *RISC-V Systems & Cross-Compilation*: Ran NixOS on SiFive HiFive RISC-V
    hardware and cross-compiled toolchains and GUI applications for riscv64,
    using QEMU emulation to validate builds and inspect compiler output at the
    disassembly level. Tech: RISC-V, QEMU, Nix, Go, C \
    Repository: #link("https://github.com/morph-k/nix-riscv")[github.com/morph-k/nix-riscv]
    | #link("https://morphykuffour.github.io/linux/riscv/qemu/ubuntu/sbcl/2025/05/06/SBCL-development-on-riscv-architecture.html")[Disassembly on RISC-V]
  ],
  [
    *Cross Platform Nix Configuration*: Developed reproducible system
    configuration to solve inconsistency problems across multiple platforms.
    Built modular Nix configuration that works seamlessly across Linux,
    #link("https://github.com/microsoft/WSL")[WSL], and OSX, reducing environment
    setup time from days to under an hour. \
    Repository: #link("https://github.com/morph-k/nix.git")[github.com/morph-k/nix]
  ],
  [
    *lookup.nvim*: Created a Neovim plugin to solve the workflow disruption of
    looking up word definitions. Implemented an API-based solution that displays
    definitions directly in the editor without context switching. \
    Repository: #link("https://github.com/morph-k/lookup.nvim")[github.com/morph-k/lookup.nvim]
  ],
  [
    *rawtalk*: Addressing the limitations of keyboard customization software,
    rawtalk is a userspace tool for direct communication with QMK keyboards.
    Leveraged the hidapi library to enable layout switching and custom macros
    without leaving the terminal. Fully functional and in active use, with layout
    switching and custom macros working end-to-end. Tech: Rust, Nix, C \
    Repository: #link("https://github.com/morph-k/rawtalk.git")[github.com/morph-k/rawtalk]
  ],
  [
    *Dactyl Manuform 5x6 Keyboard Build*: Tackled ergonomic issues of standard
    keyboards by building a custom split keyboard. Designed and assembled a
    parameterized, concave, columnar keyboard with custom firmware, reducing
    wrist strain and increasing typing comfort. Documented the entire process on
    my blog to help others with similar builds. Tech:
    #link("https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/books/C_Book_2nd.pdf")[C],
    #link("https://qmk.fm/")[QMK],
    #link("https://engineering.purdue.edu/ece477/Course/Lectures/Slides/7-HardwareDesignFundamentals.pdf")[Hardware Design] \
    Blog Post: #link("https://morphykuffour.github.io/keyboards,/ergonomics,/qmk/2021/12/29/Dactyl-Manuform.html")[Dactyl Manuform 5x6 Build Log]
  ],
)
