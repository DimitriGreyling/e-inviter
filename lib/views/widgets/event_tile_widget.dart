import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final ThemeData theme;
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final String title;
  final String date;
  final String host;
  final String hostAvatar;
  final String image;
  final String rsvp;
  final Color rsvpColor;

  const EventTile({
    required this.theme,
    required this.colorScheme,
    required this.textTheme,
    required this.title,
    required this.date,
    required this.host,
    required this.hostAvatar,
    required this.image,
    required this.rsvp,
    required this.rsvpColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.primary.withOpacity(0.5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OCT'),
              Text('21'),
            ],
          ),
        ),
        title: Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "$date • Hosted by $host",
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: rsvpColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            rsvp,
            style: textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    // return Container(
    //   width: 260,
    //   decoration: BoxDecoration(
    //     color: colorScheme.surface,
    //     borderRadius: BorderRadius.circular(16),
    //     border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
    //     boxShadow: [
    //       BoxShadow(
    //         color: colorScheme.shadow.withOpacity(0.05),
    //         blurRadius: 4,
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       // Event Image
    //       Stack(
    //         children: [
    //           ClipRRect(
    //             borderRadius:
    //                 const BorderRadius.vertical(top: Radius.circular(16)),
    //             child: Image.network(
    //               image,
    //               height: 100,
    //               width: double.infinity,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           Positioned(
    //             top: 8,
    //             right: 8,
    //             child: Container(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    //               decoration: BoxDecoration(
    //                 color: rsvpColor.withOpacity(0.9),
    //                 borderRadius: BorderRadius.circular(8),
    //               ),
    //               child: Text(
    //                 rsvp,
    //                 style: textTheme.labelSmall?.copyWith(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               title,
    //               style: textTheme.titleMedium?.copyWith(
    //                 color: colorScheme.onSurface,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               maxLines: 1,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //             const SizedBox(height: 4),
    //             Row(
    //               children: [
    //                 Icon(Icons.calendar_month,
    //                     size: 16, color: colorScheme.onSurfaceVariant),
    //                 const SizedBox(width: 4),
    //                 Text(
    //                   date,
    //                   style: textTheme.bodySmall?.copyWith(
    //                     color: colorScheme.onSurfaceVariant,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 8),
    //             Row(
    //               children: [
    //                 CircleAvatar(
    //                   radius: 12,
    //                   backgroundImage: NetworkImage(hostAvatar),
    //                   backgroundColor: colorScheme.primary.withOpacity(0.1),
    //                 ),
    //                 const SizedBox(width: 6),
    //                 Text(
    //                   "Hosted by $host",
    //                   style: textTheme.bodySmall?.copyWith(
    //                     color: colorScheme.onSurfaceVariant,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 12),
    //             Row(
    //               children: [
    //                 Expanded(
    //                   child: ElevatedButton(
    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: colorScheme.primary,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(8),
    //                       ),
    //                       elevation: 1,
    //                     ),
    //                     onPressed: () {},
    //                     child: Text(
    //                       "Accept",
    //                       style: textTheme.labelLarge?.copyWith(
    //                         color: colorScheme.onPrimary,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(width: 8),
    //                 Expanded(
    //                   child: OutlinedButton(
    //                     style: OutlinedButton.styleFrom(
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(8),
    //                       ),
    //                       side: BorderSide(
    //                         color: colorScheme.outline.withOpacity(0.2),
    //                       ),
    //                     ),
    //                     onPressed: () {},
    //                     child: Text(
    //                       "Decline",
    //                       style: textTheme.labelLarge?.copyWith(
    //                         color: colorScheme.onSurface,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
